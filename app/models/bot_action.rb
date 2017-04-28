class BotAction < ApplicationRecord
  

  include Rails.application.routes.url_helpers
  

  has_many :attachements
  has_many :posts, :through => :attachements, :source => :attachable, :source_type => 'Post'
  has_many :checks, :through => :attachements, :source => :attachable, :source_type => 'Check'
  has_many :keys, :through => :attachements, :source => :attachable, :source_type => 'Key'
  belongs_to :lesson, optional: true
  belongs_to :user
  belongs_to :bot
  validates_presence_of :user_input, message: "ты хотел что-то сказать"
  validates_length_of :user_input, minimum: 2, maximum: 200, message: "accepts only 2 - 200" 


#1
def process_input(user_input)
  if self.intent.nil?
    bot = self.bot
    user_input_tokens = clean_user_input(user_input)
    nbayes = NBayes::Base.new(binarized: true)
    # если user_say содержит переменные типа @переменная, то поочередно подставляем вместо @переменной Sample-пример переменной, привязанный к @переменной во время тренировки 
    bot.user_says.each do |say|
      category = say.intent
      if say.samples.length >= 1
        say.samples.each do |sample|
          input = say.input.gsub(/@[\wа-я]+/i).with_index do |m, i| 
            if sample.key_name == m 
              sample.name
            end
          end
          nbayes.train(input.split(/\s+/), category)
        end 
      else
        input = say.input
        nbayes.train(input.split(/\s+/), category)
      end       
    end
    nbayes.assume_uniform = true                           #
    result = nbayes.classify(user_input_tokens)            #classifying the input form user 
    #nbayes.dump('config/rembot/dump.yml')                 #dump of trained data, for us to observe how the classification is done
    result.each do |k, v|
      puts "\n#{(v * 100)} => #{k}\n"                      #display of classified log probabilities for each category
    end
    
    self.update(intent: result.max_class, lesson_id: bot.lessons.where(intent: result.max_class).first.id) 
    lesson = self.lesson 
    
    if lesson.acts.length >=1
      self.update(bot_response: lesson.acts.where(sequence: 1).sample.bot_say, sequence: 1) 
      #проверяем, привзяны ли к диалогу посты / чеклисты / данные от пользователя - если да - 
      # создаем объект-связь между ними, для последующего использования н-р bot_action.posts
      if lesson.posts.where(sequence: self.sequence).length >= 1
        lesson.posts.where(sequence: self.sequence).each do |post|
          self.attachements.create(attachable_id: post.id, attachable_type: post.class, bot_id: bot.id)
        end
      end

      if lesson.checks.where(sequence: self.sequence).length >= 1
        lesson.checks.where(sequence: self.sequence).each do |check|
          self.attachements.create(attachable_id: check.id, attachable_type: check.class, bot_id: bot.id)
        end
      end

      if lesson.keys.where(sequence: self.sequence).length >= 1
        lesson.keys.where(sequence: self.sequence).each do |key|
          self.attachements.create(attachable_id: key.id, attachable_type: key.class, bot_id: bot.id)
        end
      end

    else
      self.update_attribute(:bot_response, "Похоже бот не знает что ответить")
    end

    if self.bot.lessons.where(intent: self.intent, extract_data: true).length >= 1
      create_entity
    end
  end 
  if self.bot_response.match(/@[\wа-я]+/i)
    self.update(bot_response: change_entity(self.bot_response))
  end 
end


def change_entity(bot_response)
    self.bot_response.gsub(/@[\wа-я]+/i).with_index { |m, i| bot.entities.where(key: m, user_id: self.user_id).last.name if bot.entities.where(key: m, user_id: self.user_id).take}
end


#save @entity like @user_name from user_say
def create_entity
  a = self.bot.user_says.where(intent: self.intent)
  a.each do |user_say|
    unless user_say.regexp == nil
      if self.user_input.match(user_say.regexp)
        names = self.user_input.match(user_say.regexp).names
        captures = self.user_input.match(user_say.regexp).captures
        h = Hash[names.zip captures]
        h.each do |key, entity|
          Entity.create(key: "@"+key, name: entity, user_id: self.user_id, bot_id: self.bot_id, intent: self.intent)
        end
      end
    end
  end 
end


def classification_failed_enquiry(*args)
    self.update_attribute(:bot_response, error_response)
    return false
end


private


def clean_user_input(user_input)
    self.user_input = self.user_input.squish 
    rm_spl_chars = user_input.downcase.split(/[^[:word:]]+/)
end

end