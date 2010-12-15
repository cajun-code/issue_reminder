class Issue < ActiveRecord::Base
  has_many :reminders, :dependent => :delete_all
end