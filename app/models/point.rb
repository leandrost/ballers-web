class Point
  attr_accessor :longitude, :latitude

  def initialize(params={})
    params = { longitude: 0, latitude: 0 } if params.blank?
    @longitude = params[:longitude]
    @latitude  = params[:latitude]
  end

  def to_hash
    {
      "type": "Point",
      "coordinates": [longitude, latitude]
    }
  end

  # Converts an object of this instance into a database friendly value.
  def mongoize
    [ @longitude, @latitude ]
  end

  class << self
    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      return Point.new if object.nil?
      Point.new(longitude: object[0], latitude: object[1])
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when Point then object.mongoize
      when Hash then Point.new(object).mongoize
      else object
      end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      case object
      when Point then object.mongoize
      else object
      end
    end
  end
end
