class User < ApplicationRecord
  before_create :set_api_key, unless: :api_key?

  def api_key?
    api_key.present?
  end

  private

  def set_api_key
    self.api_key = generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless self.class.exists?(api_key: token)
    end
  end
end
