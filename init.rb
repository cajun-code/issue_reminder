require 'redmine'



Redmine::Plugin.register :redmine_issue_reminder do
  name 'Redmine Issue Reminder plugin'
  author 'Allan Davis'
  description 'Create a reminder email based on a date.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

require 'dispatcher'
Dispatcher.to_prepare :redmine_issue_reminder do
  require_dependency 'issue_reminder/hooks'

  require_dependency 'issue'
  Issue.send(:include, IssueReminder::IssuePatch)
  
end