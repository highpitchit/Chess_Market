class UsersController < ApplicationController
  before_action :set_user, only: [:index, :edit, :show, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.find(current_user.id)

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    #attaches image to the user profile
    @user.photo.attach(params[:user][:photo])

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
    #when user selects tutor or player the other role will be removed
    if params[:role] == "11"
      @user.add_role(:tutor)
      @user.remove_role(:player)
      @user.save
    elsif params[:role] == "12"
      @user.add_role(:player)
      @user.remove_role(:tutor)
    end
    @user.save
    # # @user.add_role(params[:user][:role])
    @user.photo.attach(params[:user][:photo])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :name, :ability_level, :location)
    end
end
