class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :bot_actions
    has_many :bots, :through => :subscriptions
    has_many :subscriptions
    # has_many :bots
    has_many :lessons
    has_many :user_says
    has_many :acts
    has_many :entities


  # Проверка на то, соответствует ли пост выбранным интересам пользователям
  def filter_for_user(post)
    if post.filter == ''
      return true
    else
      if self.entities.length >=1
      self.entities.each do |entity|
        if post.filter == entity.name
          return true
        else
          return false
        end
      end
      else
        false
      end
    end
  end

  def when_subscribed_to(bot)
    if s = self.subscriptions.where(bot_id: bot.id).take
      return s.created_at
    end
  end


end
