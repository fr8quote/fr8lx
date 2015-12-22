class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

#-------------------------------------------------------------------------------

  def index
   @trips = current_user.trips
   #@trips = Trip.all
  end

#-------------------------------------------------------------------------------

  def show
    @status_times = @trip.status_times.all
    #@status_times = @trip.current_user.status_times
  end

#-------------------------------------------------------------------------------

  def new
    @trip = Trip.new
    @trip.status_times.new
  end

#-------------------------------------------------------------------------------

  def edit # name change in routes to "detials'
    @status_times = @trip.status_times(params[:id])
    @trip = current_user.trips(params[:id])
    @tripdate = current_user.trips.find(params[:id])
   
  end

#-------------------------------------------------------------------------------

 def create
    
    @trip = current_user.trips.new(trip_params)
    #@trip = Trip.find(params[:trip_id])
    #@status_time = @trip.status_times.create(status_time_params)
   # @status_time.user_id = current_user.id if current_user

 
    if @trip.save
       redirect_to @trip, notice: 'Trip was successfully created.' 
    
    else
      render :new 
    
    end
  end

#-------------------------------------------------------------------------------

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

#-------------------------------------------------------------------------------

  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
#-------------------------------------------------------------------------------

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end
    
#-------------------------------------------------------------------------------

    def trip_params
      params.require(:trip).permit(
        :user_id, :created_at,
          status_times_attributes: [
            :user_id, 
            :_destroy,
            :status,
            :notes,
            :location,
            :created_at,
            :updated_at,
            :trip_id,
            :id
            ]
          )
    end
end
