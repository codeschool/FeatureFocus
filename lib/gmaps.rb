require 'cgi'
require 'json'

module Gmaps

  GMAPS_URL = "http://maps.googleapis.com/maps/api/geocode/json?address=%s"

  def self.coordinates_from_address(address)
    safe_get do
      response = fetch_for(CGI.escape(address))
      parse_response(response)
    end
  end

  def self.fetch_for(escaped_address)
    uri = GMAPS_URL % escaped_address
    Net::HTTP.get(URI.parse(uri))
  end

  def self.parse_response(response_string)
    response = JSON.parse(response_string, symbolize_names: true)

    Rails.logger.info response

    # Getting the first result only.
    location = response[:results].first[:geometry][:location]

    [location.fetch(:lat), location.fetch(:lng)]
  end

  def self.safe_get
    begin
      yield
    rescue => e
      Rails.logger.info("Error: #{e.inspect}")
      []
    end
  end
end

