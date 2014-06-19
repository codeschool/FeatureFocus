module DealsHelper
  def calculate_distance(deal_latlon, coordinates)
    lon, lat = coordinates.split(',').reverse
    user_point = 'POINT(%s %s)' % [lon, lat]
    user = User.new(latlon: user_point)
    "%.02f " % (deal_latlon.distance(user.latlon) * 0.00062137)
  end
end
