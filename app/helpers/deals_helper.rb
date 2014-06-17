module DealsHelper
  def calculate_distance(deal_latlon, user_latlon)
    "%.02f " % (deal_latlon.distance(user_latlon) * 0.00062137)
  end
end
