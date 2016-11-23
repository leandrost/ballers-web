class Court
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :address, type: String
  field :coordinates, type: Point
end
