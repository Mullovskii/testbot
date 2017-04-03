class EntitiesController < ApplicationController
  # before_action :set_entity, only: [:show, :edit, :update, :destroy]

 
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:bot_id, :user_id, :name, :key, :intent)
    end
end
