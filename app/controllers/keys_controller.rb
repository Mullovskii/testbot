class KeysController < ApplicationController
  before_action :set_key, only: [:show, :edit, :update, :destroy]

  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.all
  end

  # GET /keys/1
  # GET /keys/1.json
  def show
  end

  # GET /keys/new
  def new
    @key = Key.new
  end

  # GET /keys/1/edit
  def edit
  end

  # POST /keys
  # POST /keys.json
  def create
    @key = Key.create(key_params)

    respond_to do |format|
      if @key.save
        unless @key.name.match(/@[\wа-я]+/i)
          @key.update(name: "@" + @key.name)
        end  

        format.html { redirect_to :back, notice: 'Key was successfully created.' }
        format.json { render :show, status: :created, location: @key }
      else
        format.html { redirect_to :back }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keys/1
  # PATCH/PUT /keys/1.json
  def update
    respond_to do |format|
      if @key.update(key_params)
        format.html { redirect_to :back, notice: 'Key was successfully updated.' }
        format.json { render :show, status: :ok, location: @key }
      else
        format.html { redirect_to :back }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @key.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_params
      params.require(:key).permit(:user_say_id, :bot_id, :name, :intent, :sequence, :lesson_id)
    end
end
