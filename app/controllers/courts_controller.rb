class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  def index
    location = if params[:nearby].present?
                 nearby_location
               elsif [:latitude, :longitude].all? { |s| params.key?(s) }
                 params.slice(:latitude, :longitude)
               end
    assign_presenter(location.present? ? Court.near_by(location) : Court.all)
  end

  def nearby_location
    result = Geocoder.search(params[:nearby])
    return nil if result.blank?
    result.first.geometry["location"]
  end

  # GET /courts/1
  def show; end

  # GET /courts/new
  def new
    @court = Court.new
  end

  # GET /courts/1/edit
  def edit; end

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
    if @court.update(court_params)
      redirect_to @court, notice: "Court was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
    redirect_to courts_url, notice: "Court was successfully destroyed."
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

  def assign_presenter(courts)
    markers = courts.to_a.map do |court|
      {
        key: court.id.to_s,
        position: { lat: court.latitude, lng: court.longitude },
        defaultAnimation: 2
      }
    end
    @presenter = OpenStruct.new(courts: courts, markers: markers)
  end
end
