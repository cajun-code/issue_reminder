module IssueReminder
  class Hooks < Redmine::Hook::ViewListener
    ### Show on new and update forms
    # render_on :view_issues_form_details_bottom, 
    # :partial => "issue/issue_reminder"
    # def view_issues_form_details_bottom(context={ })
    #   context[:reminders]= context[:issue].reminders
    #   context[:reminder] = Reminder.new
    #   context[:controller].send(:render_to_string, {
    #     :partial => "issue/issue_reminder",
    #     :locals => context 
    #   })
    # end
    # def controller_issues_new_before_save(context={})
    #   context[:reminder]
    # end
    # alias_method :controller_issues_edit_before_save, :controller_issues_new_before_save
    
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