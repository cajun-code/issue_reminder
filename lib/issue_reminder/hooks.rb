module IssueReminder
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_form_details_bottom, 
    :partial => "issue/issue_reminder"
  end
end