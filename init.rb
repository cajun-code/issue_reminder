require 'redmine'



Redmine::Plugin.register :redmine_issue_reminder do
  name 'Issue Reminder plugin'
  author 'Allan Davis'
  description 'Create a reminder email based on a date.'
  version '0.0.2'
  url 'http://github.com/javaalley/issue_reminder'
  author_url 'http://github.com/javaalley'
end

require 'dispatcher'
Dispatcher.to_prepare :redmine_issue_reminder do
  require_dependency 'issue_reminder/hooks'

  require_dependency 'issue'
  Issue.send(:include, IssueReminder::IssuePatch)
  
end