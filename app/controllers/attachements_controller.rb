class AttachementsController < ApplicationController
	before_action :set_attachement, only: [:destroy]
  	
  	def create
  		@attachement = Attachement.new(attachement_params)

	    respond_to do |format|
	      if @attachement.save
	        format.html { redirect_to :back, notice: 'attachement was successfully created.' }
	        format.json { render :show, status: :created, location: @attachement }
	      else
	        format.html { redirect_to :back }
	        format.json { render json: @attachement.errors, status: :unprocessable_entity }
	      end
    end

  	end

  	def destroy
  		@attachement.destroy
	    respond_to do |format|
	      format.html { redirect_to :back , notice: 'attachement was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachement
      @attachement = Attachement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachement_params
      params.require(:attachement).permit(:bot_id, :bot_action_id, :attachable_id, :attachable_type)
    end

end
