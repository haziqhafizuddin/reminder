# authenticate Stride
class AuthenticateService
  AUTH_TOKEN_URL = 'https://api.atlassian.com/oauth/token'.freeze

  def initialize; end

  def access_token
    HTTParty.post(
      AUTH_TOKEN_URL,
      body: body.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end

  private

  def body
    {
      grant_type: 'client_credentials',
      client_id: ENVied.CLIENT_ID,
      client_secret: ENVied.CLIENT_SECRET
    }
  end
end
