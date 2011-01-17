namespace :reminder do

  task :send => :environment do
    ReminderMailer.send_reminders
  end
end