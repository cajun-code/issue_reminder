class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.column :issue_id, :integer
      t.column :reminder_date, :date
    end
  end

  def self.down
    drop_table :reminders
  end
end
