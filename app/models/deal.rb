class Deal < ActiveRecord::Base
  belongs_to :vendor

  scope :near, ->(user) {
    joins(:vendor).
      order("ST_Distance(vendors.latlon, ST_GeomFromText('#{user.latlon}'))")
  }
end
