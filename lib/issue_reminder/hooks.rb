module IssueReminder
  class Hooks < Redmine::Hook::ViewListener
    ### Show on new and update forms
    render_on :view_issues_form_details_bottom, 
    :partial => "issue/issue_reminder_form"
    
    
    def controller_issues_new_after_save(context={ })      
      reminder_date = context[:params][:reminder_date]
      context[:issue].reminders.create(:reminder_date => reminder_date) unless reminder_date.blank?
    end
    # alias_method :controller_issue_edit_after_save, :controller_issues_new_after_save
    ### Show on Show form
    #:view_issues_show_description_bottom
    def view_issues_show_description_bottom(context={ })
      context[:reminders]= context[:issue].reminders
      context[:reminder] = Reminder.new
      context[:controller].send(:render_to_string, {
        :partial => "issue/issue_reminder",
        :locals => context 
      })
    end
  end
end