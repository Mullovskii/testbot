class UserSaysController < ApplicationController
  before_action :set_user_say, only: [:show, :edit, :update, :destroy]

  # GET /user_says
  # GET /user_says.json
  def index
    @user_says = UserSay.all
  end

  # GET /user_says/1
  # GET /user_says/1.json
  def show
  end

  # GET /user_says/new
  def new
    @user_say = UserSay.new
  end

  # GET /user_says/1/edit
  def edit
  end

  # POST /user_says
  # POST /user_says.json
  def create
    @user_say = current_user.user_says.create(user_say_params)

    respond_to do |format|
      if @user_say.save
        format.html { redirect_to @user_say.bot, notice: 'User say was successfully created.' }
        format.json { render :show, status: :created, location: @user_say }
      else
        format.html { redirect_to @user_say.bot }
        format.json { render json: @user_say.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_says/1
  # PATCH/PUT /user_says/1.json
  def update
    respond_to do |format|
      if @user_say.update(user_say_params)
        format.html { redirect_to :back, notice: 'User say was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_say }
      else
        format.html { render :edit }
        format.json { render json: @user_say.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_says/1
  # DELETE /user_says/1.json
  def destroy
    @user_say.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'User say was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_say
      @user_say = UserSay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_say_params
      params.require(:user_say).permit(:input, :lesson_id, :user_id, :bot_id, :intent)
    end
end
