class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :new_bot_action

# API
  include Response
  include ExceptionHandler
# API 


  def new_bot_action
    if current_user.present?
      @bot_action = BotAction.new
      @latest_bot_actions = current_user.bot_actions.last(5)
      	if @latest_bot_actions.length < 1
			   @latest_bot_actions << BotAction.greeting(current_user.id)
			   #current_user.bot_actions.create(bot_response: "Привет! Меня зовут Хлои. Показать тебе интересные события рядом?", created_at: Time.now)
		    end
    end
  end


end
