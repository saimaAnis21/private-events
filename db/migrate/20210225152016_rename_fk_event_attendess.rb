class RenameFkEventAttendess < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_attendees, :event_id, :attended_event_id
  end
end
