class StatusTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_status_time, only: [:show, :edit, :update, :destroy]

#------------------------------------------------------------------------------ 

  def create
    @trip = Trip.find(params[:trip_id])
    @status_time = @trip.status_times.create(status_time_params)
    @status_time.user_id = current_user.id if current_user


      if @status_time.save
       redirect_to trip_path( @trip), notice: 'Your driving status has been updated.' 
        
      else
         redirect_to trip_path( @trip), notice: "what the hell are you trying to do" 
       
      end
    end


#------------------------------------------------------------------------------ 

  def destroy
    @status_time.destroy
    respond_to do |format|
      format.html { redirect_to status_times_url, notice: 'Status time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
#------------------------------------------------------------------------------ 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_time
      @status_time = StatusTime.find(params[:id])
    end

#------------------------------------------------------------------------------ 

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_time_params
      params.require(:status_time).permit(:status, :location, :notes, :time, :trip_id, :user_id)
    end
end
