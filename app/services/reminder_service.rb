# for reminder
class ReminderService
  AUTH_TOKEN_URL = 'https://api.atlassian.com/oauth/token'.freeze
  CHANNEL_URL = "https://api.atlassian.com/site/#{ENVied.CLOUD_ID}/conversation".freeze

  def initialize; end

  def standup_reminder
    retrieve_channel['values'].map do |channel|
      HTTParty.post(
        CHANNEL_URL + "/#{channel['id']}/message",
        body: {
          version: 1,
          type: 'doc',
          content: [{
            type: 'paragraph',
            content: [
              {
                type: 'text',
                text: 'Yo guys! Do not forget to submit your Standup! '
              },
              {
                type: 'emoji',
                attrs: {
                  shortName: ':bear:',
                  text: 'bear'
                }
              }
            ]
          }]
        }.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{access_token['access_token']}"
        }
      )
    end
  end

  private

  def access_token
    HTTParty.post(
      AUTH_TOKEN_URL,
      body: {
        grant_type: 'client_credentials',
        client_id: ENVied.CLIENT_ID,
        client_secret: ENVied.CLIENT_SECRET
      }.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end

  def retrieve_channel
    HTTParty.get(
      CHANNEL_URL,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{access_token['access_token']}"
      }
    )
  end
end
