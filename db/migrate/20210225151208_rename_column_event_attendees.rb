class RenameColumnEventAttendees < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_attendees, :user_id, :attendee_id
  end
end
