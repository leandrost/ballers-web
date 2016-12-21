class Court
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :name, type: String
  field :address, type: String
  field :coordinates, type: Point, sphere: true

  def latitude
    coordinates.y
  end

  def longitude
    coordinates.x
  end

  def self.near_by(coordinates, distance=5000)
    coordinates = coordinates.with_indifferent_access

    latitude = coordinates[:latitude] || coordinates[:lat]
    longitude = coordinates[:longitude] || coordinates[:lng]
    point = {
      "type": "Point",
      "coordinates": [longitude.to_f, latitude.to_f]
    }

    near(coordinates: point).
      max_distance(coordinates: distance)
  end
end
