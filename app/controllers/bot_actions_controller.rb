class BotActionsController < ApplicationController

  def new
    @bot_action = BotAction.new
  end
  
  def create
    @bot_action = current_user.bot_actions.create(bot_action_params)
    redirect_to :back
  end

  def process_user_input
    @bot_action = current_user.bot_actions.build(bot_action_params)
    if @bot_action.save
      unless @bot_action.intent == nil
        if Act.where(bot_id: @bot_action.bot_id, intent: @bot_action.intent, sequence: @bot_action.sequence).length >=1
          @bot_action.update(bot_response: Act.where(bot_id: @bot_action.bot_id, intent: @bot_action.intent, sequence: @bot_action.sequence).sample.bot_say) 
        else
          @bot_action.update(bot_response: "Похоже бот не знает что ответить") 
        end
      end
      @return_user_input = @bot_action.user_input
      computed_path = @bot_action.process_input(@return_user_input)
      @return_bot_response = @bot_action.bot_response
    end
    respond_to do |format|
      format.js
    end
  end

  def filter_for_user
    
  end
 
  private
 
  def bot_action_params
    params.require(:bot_action).permit(:user_input, :user_id, :bot_id, :intent, :bot_response, :sequence, :waiting_response )
  end
end