class Event < ApplicationRecord

    # has_many :event_attendees, foreign_key: :user_event_id
    # has_many :attendees, through: :event_attendees, source: :event_user
    belongs_to :creator, class_name: "User"

end
