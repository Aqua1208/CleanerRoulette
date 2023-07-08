class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def api
    places = Place.pluck(:name)
    cleaners = session[:cleaners]

    render :json => { places: places, cleaners: cleaners }
  end

  def roulette
    attendee = User.where(attend: true).pluck(:name)
    session[:cleaners] = attendee.to_a.sample(6)

    redirect_to users_path
  end

  def attend
    user = User.find(params[:id])
    user.update(attend: !user.attend)
    redirect_to users_path
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @logs = Log.all

    @AllFrequency = @logs.where(user_id: @user.id).count
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    @user.reload
  end

  def update_status_all
    @users = User.where(id: params[:users].keys).update_all(attend: params[:status_to]) if params[:users].present?
    redirect_to users_path
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :attend)
    end
end
