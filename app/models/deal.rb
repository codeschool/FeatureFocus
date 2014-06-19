class Deal < ActiveRecord::Base
  belongs_to :vendor

  has_many :referrals

  scope :near, ->(coordinates) {
    return unless coordinates.present?

    # longitude comes first for PostGIS
    lon, lat = coordinates.split(',').reverse
    point = 'POINT(%s %s)' % [lon, lat]

    joins(:vendor).
      order("ST_Distance(vendors.latlon, '#{point}') ASC")
  }

  scope :active, ->{ where('ends_at > ?', Time.now) }

  def price
    price_in_cents / 100.0
  end

  def seconds_left
    ends_at.utc.to_i - Time.now.utc.to_i
  end
end
