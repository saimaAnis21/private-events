class AddFkToEventAttendees < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendees, :user, null: false, foreign_key: true
  end
end
