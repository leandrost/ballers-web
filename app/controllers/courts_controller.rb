class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  def index
    @presenter = set_presenter
  end

  # GET /courts/1
  def show
  end

  # GET /courts/new
  def new
    @court = Court.new
  end

  # GET /courts/1/edit
  def edit
  end

  # POST /courts
  def create
    @court = Court.new(court_params)
    if @court.save
      redirect_to @court, notice: "Court was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /courts/1
  def update
    respond_to do |format|
      if @court.update(court_params)
        format.html { redirect_to @court, notice: "Court was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
    respond_to do |format|
      format.html { redirect_to courts_url, notice: "Court was successfully destroyed." }
    end
  end

  private

  def set_court
    @court = Court.find(params[:id])
  end

  def court_params
    params.require(:court).permit(
      :name,
      :address,
      coordinates: [:latitude, :longitude]
    )
  end

  def set_presenter
    courts = Court.all.to_a
    markers = courts.map do |court|
      {
        key: court.id.to_s,
        position: {
          lat: court.coordinates.latitude.to_f,
          lng: court.coordinates.longitude.to_f
        },
        defaultAnimation: 2,
      }
    end
    OpenStruct.new(courts: courts, markers: markers)
  end
end
