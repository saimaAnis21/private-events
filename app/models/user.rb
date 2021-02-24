class User < ApplicationRecord

    # has_many :eventattendees, foreign_key: :event_user_id
    # has_many :user_events, through: :eventattendees
    has_many :created_events, class_name: "Event", :source "creator"

end
