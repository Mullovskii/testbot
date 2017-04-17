class EntitiesController < ApplicationController
  # before_action :set_entity, only: [:show, :edit, :update, :destroy]
  def create_check_entity
    @entity = current_user.entities.build(entity_params)
    if @entity.save
      @user_entities = current_user.entities.map { |e| e.name }
      if @entity.key == nil
        @entity.update(key: "@#{@entity.name.downcase}")
      else
        # @entity.update(key: "@#{@entity.name.downcase}")
      end
    end
    respond_to do |format|
      format.js
    end
  end
 
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:bot_id, :user_id, :name, :key, :intent)
    end
end
