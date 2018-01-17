# for reminder
class ReminderService
  AUTH_TOKEN_URL = 'https://api.atlassian.com/oauth/token'.freeze

  def initialize; end

  def send_all_reminder
    
  end

  private

  def access_token
    HTTParty.post(
      AUTH_TOKEN_URL,
      body: {
        
      }
    )
  end
end
