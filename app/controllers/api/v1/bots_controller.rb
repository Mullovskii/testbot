module Api
  module V1
    # app/controllers/bots_controller.rb
    class BotsController < ApplicationController
      before_action :set_bot, only: [:show, :update, :destroy, :subscriptions, :lessons]

      # GET /api/bots
      def index
        @bots = Bot.all
        json_response(@bots)
      end

      # POST /api/bots
      def create
        @bot = Bot.create!(bot_params)
        json_response(@bot, :created)
      end

      # GET /api/bots/:id
      def show
        render :json => @bot.to_json(:include => [{ :lessons => {:include => [:acts, :posts, :checks, :user_says, :schedules]}},
                                                    :checks,
                                                    :keys,
                                                    :subscriptions])
      end

      # PUT /api/bots/:id
      def update
        @bot.update(bot_params)
        head :no_content
      end

      # DELETE /api/bots/:id
      def destroy
        @bot.destroy
        head :no_content
      end


      # # GET /api/bots/:id/lessons
      # def lessons
      #   @bot_lessons = @bot.lessons
      #   json_response(@bot_lessons)
      # end

      # # GET /api/bots/:id/subscriptions
      # def subscriptions
      #   @subscriptions = @bot.subscriptions
      #   json_response(@subscriptions)
      # end

      private

      def bot_params
        # whitelist params
        params.permit(:name, :user_id)
      end

      def set_bot
        @bot = Bot.find(params[:id])
      end
    end
  end
end