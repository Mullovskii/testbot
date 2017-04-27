# module Api
#   module V1
#     class UsersController < ApplicationController
#       before_action :set_user, only: [:show, :subscriptions, :filter_for_user]


#       # GET api/users/:id
#       def show
#         @user_bot_actions = @user.bots
#         # render :json => @user_bot_actions.to_json(:include => [:bot_actions])
#         BotAction.current_user = current_user
#         render :json => @user_bot_actions.to_json({:include => { :bot_actions => { :methods => :filter_for_user? }}})
#       end

#       # @object.to_json({:include => { :assocation_a => { :methods => :my_method }})


#       # def filter_for_user(current_user_id)
#       # end




#       # # PUT /bots/:id
#       # def update
#       #   @user.update(bot_params)
#       #   head :no_content
#       # end

#       # # DELETE /bots/:id
#       # def destroy
#       #   @user.destroy
#       #   head :no_content
#       # end

#       private

#       def user_params
#         # whitelist params
#         params.permit(:email)
#       end

#       def set_user
#         @user = User.find(params[:id])
#       end
#     end
#   end
# end