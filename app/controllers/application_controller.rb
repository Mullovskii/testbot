class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :new_bot_action
 
  def new_bot_action
    if current_user.present?
      @bot_action = BotAction.new
      @bot_chat = current_user.bot_actions.last(2)
      	if @bot_chat.length < 1
			   @bot_chat << BotAction.greeting(current_user.id)
			   #current_user.bot_actions.create(bot_response: "Привет! Меня зовут Хлои. Показать тебе интересные события рядом?", created_at: Time.now)
		    end
    end
  end
end
