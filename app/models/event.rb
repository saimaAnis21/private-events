class Event < ApplicationRecord

    has_many :event_attendees, foreign_key: :attendee_event_id
    has_many :attendees, through: :event_attendees, source: :attendee
    belongs_to :creator, class_name: "User"

end
