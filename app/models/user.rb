class User < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon,
                              RGeo::Geographic.spherical_factory(:srid => 4326))


  after_validation :set_token


  protected
    def set_token
      return if self.referral_token.present?
      self.referral_token = generate_token
    end

  private
    def generate_token
      loop do
        token = SecureRandom.hex(5)
        break token unless self.class.exists?(referral_token: token)
      end
    end
end
