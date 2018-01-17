namespace :reminder do
  desc 'Sending Reminder'
  task standup: :environment do
    ReminderService.new.standup_reminder
  end
end
