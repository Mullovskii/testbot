# module Api
#   module V1
#     class UsersController < ApplicationController
#       before_action :set_user, only: [:show, :subscriptions]


#       # GET api/users/:id
#       def show
#         json_response(@user)
#       end


     




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

#       def set_bot
#         @user = User.find(params[:id])
#       end
#     end
#   end
# end