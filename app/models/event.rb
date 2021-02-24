class Event < ApplicationRecord

    has_many :eventattendees, foreign_key: :user_event_id
    has_many :attendees, through: :eventattendees, source: :event_user
    belongs_to :creator, class_name: "User"

end
