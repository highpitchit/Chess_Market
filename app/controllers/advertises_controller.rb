class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]
  #creates before action to only allow tutors to access create
  before_action :authorize, only: [:new, :edit, :update, :create]
  
  # GET /advertises
  # GET /advertises.json
  def index
    @advertises = Advertise.all
  end

  # GET /advertises/1
  # GET /advertises/1.json
  def show
   
  end

  # GET /advertises/new
  def new
    @advertise = Advertise.new
  end

  # GET /advertises/1/edit
  def edit
  end

  # POST /advertises
  # POST /advertises.json
  def create
    @advertise = Advertise.new(advertise_params)
    @advertise.user_id = current_user.id
    respond_to do |format|
      if @advertise.save
        format.html { redirect_to @advertise, notice: 'Advertise was successfully created.' }
        format.json { render :show, status: :created, location: @advertise }
      else
        format.html { render :new }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertises/1
  # PATCH/PUT /advertises/1.json
  def update
    
    respond_to do |format|
      if @advertise.update(advertise_params)
        format.html { redirect_to @advertise, notice: 'Advertise was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertise }
      else
        format.html { render :edit }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertises/1
  # DELETE /advertises/1.json
  def destroy
    @advertise.destroy
    respond_to do |format|
      format.html { redirect_to advertises_url, notice: 'Advertise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #Only Tutors can create Job advertisements
    def authorize
      if current_user.has_role?(:player)
          flash[:alert] = "Unauthorized"
          redirect_to advertises_path
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advertise_params
      params.require(:advertise).permit(:user_id, :date, :title, :job_offer)
    end
end
