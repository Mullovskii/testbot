class Schedule < ApplicationRecord
  belongs_to :bot
  belongs_to :lesson

  def self.run
  	# Act.last.update_attributes(bot_say: "1")
  # 	Schedule.all.where(time: Time.now.hour).each do |s|
  # 		if s.lesson.acts.where(proactive: true).length >= 1
  # 			BotActions.create(bot_id: s.bot_id, intent: s.intent, bot_response: s.lesson.acts.where(proactive: true).sample.bot_say)
  # 		end
  # 	end
  end

end
