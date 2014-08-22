class User < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon,
                              RGeo::Geographic.spherical_factory(:srid => 4326))


  after_validation :set_token


  protected
    def set_token
      return if self.referral_token.present?
      self.referral_token = SecureRandom.uuid.gsub(/\-/, '')
    end
end
