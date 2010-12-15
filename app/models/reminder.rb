class Reminder < ActiveRecord::Base
  unloadable
  belongs_to :issue
end
