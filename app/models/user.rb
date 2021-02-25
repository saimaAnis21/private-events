class User < ApplicationRecord

    # has_many :event_attendees, foreign_key: :event_user_id
    # has_many :user_events, through: :event_attendees
    has_many :created_events, foreign_key: "creator_id", class_name: "Event", inverse_of: 'creator'

end
