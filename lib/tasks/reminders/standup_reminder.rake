namespace :reminder do
  desc 'Sending Reminder'
  task standup: :environment do
    unless Date.today.saturday? || Date.today.sunday?
      ReminderService.new.standup_reminder
    end
  end
end
