module IssueReminder
  module IssuePatch
      def self.included(base)
        base.extend(ClassMethods)

        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          has_many :reminders, :dependent => :delete_all
        end
      end

      module ClassMethods
      end

      module InstanceMethods
      end
  end
end
  
