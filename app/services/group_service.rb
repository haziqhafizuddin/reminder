# for getting all channel from stride
class GroupService
  CHANNEL_URL = "https://api.atlassian.com/site/#{ENVied.CLOUD_ID}/conversation".freeze

  def initialize; end

  def retrieve_channel
    HTTParty.get(
      CHANNEL_URL,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{access_token['access_token']}"
      }
    )
  end

  private

  def access_token
    AuthenticateService.new.access_token
  end
end
