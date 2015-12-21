class StatusTimesController < ApplicationController
  before_action :set_status_time, only: [:show, :edit, :update, :destroy]

  # GET /status_times
  # GET /status_times.json
  def index
    @status_times = StatusTime.all
  end

  # GET /status_times/1
  # GET /status_times/1.json
  def show
  end

  # GET /status_times/new
  def new
    @status_time = StatusTime.new
  end

  # GET /status_times/1/edit
  def edit
  end

  # POST /status_times
  # POST /status_times.json
  def create
    @status_time = StatusTime.new(status_time_params)

    respond_to do |format|
      if @status_time.save
        format.html { redirect_to @status_time, notice: 'Status time was successfully created.' }
        format.json { render :show, status: :created, location: @status_time }
      else
        format.html { render :new }
        format.json { render json: @status_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_times/1
  # PATCH/PUT /status_times/1.json
  def update
    respond_to do |format|
      if @status_time.update(status_time_params)
        format.html { redirect_to @status_time, notice: 'Status time was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_time }
      else
        format.html { render :edit }
        format.json { render json: @status_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_times/1
  # DELETE /status_times/1.json
  def destroy
    @status_time.destroy
    respond_to do |format|
      format.html { redirect_to status_times_url, notice: 'Status time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_time
      @status_time = StatusTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_time_params
      params.require(:status_time).permit(:status, :location, :notes, :user_id, :trip_id)
    end
end
