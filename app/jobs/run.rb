class Run
  @queue = :run_job
  puts 'test'
  def self.perform
    # Do anything here, like access models, etc
    puts "Doing job"

   	Schedule.all.where(time: Time.now.hour).each do |schedule|
      if schedule.repeat_daily == true || schedule.send("#{Time.now.strftime("%A")}".to_sym) == true 
        @bot_action = BotAction.new(bot_id: schedule.bot_id, bot_response: Act.where(intent: schedule.intent, bot_id: schedule.bot_id, proactive: true).sample.bot_say, intent: schedule.intent)
        @bot_action.save!(validate: false)
      end
   	end

    # Schedule.all.where(time: Time.now.hour).each do |schedule|
    #   @bot_action = BotAction.new(bot_id: schedule.bot_id, bot_response: Act.where(intent: schedule.intent, bot_id: schedule.bot_id, proactive: true).sample.bot_say, intent: schedule.intent)
    #   @bot_action.save!(validate: false)
    # end

  end
end