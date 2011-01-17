class Reminder < ActiveRecord::Base
  unloadable
  belongs_to :issue
  validate :valid_date?
  
  private
  def valid_date?
    unless reminder_date && reminder_date >= Date.today 
      errors.add(:reminder_date, "Reminder date is invalid")
    end
  end
end
