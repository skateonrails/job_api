module AuthHelper
  def http_login
    { 'HTTP_AUTHORIZATION' => token }
  end

  def controller_http_login
    request.env['HTTP_AUTHORIZATION'] = token
  end

  private

  def token
    "Token #{api_key}"
  end

  def api_key
    @api_key ||= User.create.api_key
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :controller
  config.include AuthHelper, type: :request
end
