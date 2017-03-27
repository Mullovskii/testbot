class RunJob
  @queue = :run_job
  def self.perform()
    # Do anything here, like access models, etc
    puts "Doing my job"
   	BotAction.create!(bot_response: "Test")
  end
end