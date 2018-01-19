class StandupService
  CHANNEL_URL = "https://api.atlassian.com/site/#{ENVied.CLOUD_ID}/conversation".freeze

  def initialize; end

  def send_reminder
    StrideGroup.standup.each do |stride|
      HTTParty.post(
        url(stride.group_id),
        body: body(stride.message).to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{access_token['access_token']}"
        }
      )
    end
  end

  private

  def url(id)
    CHANNEL_URL + "/#{id}/message"
  end

  def body(message)
    {
      version: 1,
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [
          {
            type: 'text',
            text: message
          }
        ]
      }]
    }
  end

  def access_token
    AuthenticateService.new.access_token
  end
end
