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
    end
  end


end
