class Court
  include Mongoid::Document

  field :name, type: String
  field :address, type: String
  field :coordinates, type: Point

  delegate :latitude, to: :coordinates
  delegate :longitude, to: :coordinates

  def initialize(args=nil)
    super(args)
    @coordinates = Point.new(@coordinates) unless @coordinates.is_a?(Point)
  end
end
