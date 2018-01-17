namespace :send do
  desc 'Sending Reminder'
  task reminder: :environment do
    ReminderService.new.send_all_reminder
  end
end
