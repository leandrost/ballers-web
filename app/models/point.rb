class Point
  attr_accessor :longitude, :latitude

  def initialize(params={})
    if params.present?
      @latitude  = params[:latitude]
      @longitude = params[:longitude]
    end
  end

  def to_hash
    {
      "type": "Point",
      "coordinates": [longitude, latitude]
    }
  end
end
