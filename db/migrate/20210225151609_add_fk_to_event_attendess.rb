class AddFkToEventAttendess < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendees, :event, null: false, foreign_key: true
  end
end
