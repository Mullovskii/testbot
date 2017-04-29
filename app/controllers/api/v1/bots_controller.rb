module Api
  module V1
    # app/controllers/bots_controller.rb
    class BotsController < ApplicationController
      before_action :set_bot, only: [:show, :update, :destroy, :chat]

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

      # уникальный чат бота и уникального юзера
      # GET /api/bots/:id/chat
      def chat
        # @d = current_user.created_at.to_date.mjd - BotAction.last.created_at.to_date.mjd

        # смотрим все анонимные экшены, созданные после подписки юзера на бота, с пометкой "напомнить спустя Н дней"
        @remind_over_actions = []
        @bot.bot_actions.where("created_at < ?", current_user.when_subscribed_to(@bot)).where.not(remind_over: nil).each do |bot_action|
          # проверяем прошло ли с момента подписки столько же дней, сколько в пометке экшена
          if bot_action.remind_over == Time.now.to_date.mjd - current_user.when_subscribed_to(@bot).to_date.mjd
            @remind_over_actions << bot_action
          end
        end

        @chat = @bot.bot_actions.where(user_id: nil, remind_over: nil) + @bot.bot_actions.where(user_id: current_user.id) + @remind_over_actions
        @chat = @chat.sort_by &:created_at
        render :json => @chat.to_json(:include => [:posts, :checks, :keys])
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