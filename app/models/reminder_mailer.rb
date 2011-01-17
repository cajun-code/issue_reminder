class ReminderMailer < ActionMailer::Base
  def remind(issue)
    content_type "text/html"
    subject  "Issue #{issue.id} is due on #{issue.due_date}"
    recipients issue.assigned_to.mail
    from "revtrack@revenuemed.com"    
    body :issue => issue
  end
  
  def self.send_reminders    
    reminders = Reminder.find(:all, :conditions => "reminder_date = '#{Date.today}'")
    reminders.each do |reminder|
      ReminderMailer.deliver_remind(reminder.issue)
    end
  end
end