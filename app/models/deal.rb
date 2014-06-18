class Deal < ActiveRecord::Base
  belongs_to :vendor

  has_many :referrals

  scope :near, ->(user) {
    joins(:vendor).
      order("ST_Distance(vendors.latlon, '#{user.latlon}') ASC")
  }
end
