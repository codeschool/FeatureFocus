require 'gmaps'

class Vendor < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon,
                              RGeo::Geographic.spherical_factory(:srid => 4326))

  has_many :deals, dependent: :destroy

  def self.create_with_coordinates!(params={})
    create!(params).tap do |vendor|
      load_coordinates(vendor)
    end
  end

  def self.load_coordinates(vendor)
    lat, lon = Gmaps.coordinates_from_address(vendor.address)
    vendor.latlon = "POINT(#{lon} #{lat})"
    vendor.save!
  end
end


