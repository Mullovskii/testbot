module Api
  module V1
    # app/controllers/bots_controller.rb
    class BotsController < ApplicationController
      before_action :set_bot, only: [:show, :update, :destroy]

      # GET /bots
      def index
        @bots = Bot.all
        json_response(@bots)
      end

      # POST /bots
      def create
        @bot = Bot.create!(bot_params)
        json_response(@bot, :created)
      end

      # GET /bots/:id
      def show
        json_response(@bot)
      end

      # PUT /bots/:id
      def update
        @todo.update(bot_params)
        head :no_content
      end

      # DELETE /bots/:id
      def destroy
        @bot.destroy
        head :no_content
      end

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