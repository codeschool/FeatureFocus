class Referral < ActiveRecord::Base
  belongs_to :deal
  belongs_to :referrer, class_name: 'User'
  belongs_to :referee, class_name: 'User'

  after_validation :set_token


  protected
    def set_token
      return if self.token.present?
      self.token = generate_token
    end

  private
    def generate_token
      loop do
        token = SecureRandom.hex(5)
        break token unless self.class.exists?(token: token)
      end
    end
end
