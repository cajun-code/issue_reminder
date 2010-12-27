class ReminderController < ApplicationController
  unloadable


  def create
    reminder = Reminder.new params[:reminder]
    reminder.save
    populate_reminders reminder.issue_id    
    render :action => "index"    
  end

  def delete
    reminder = Reminder.find params[:id]
    issue_id = reminder.issue_id
    reminder.delete
    populate_reminders issue_id    
    render :action => "index"  
  end
  def index
    populate_reminders params[:issue_id]
    respond_to do |format|
      format.js 
    end
  end
  private
  def populate_reminders (issue_id)
    @reminders = Issue.find(issue_id).reminders
  end
end
