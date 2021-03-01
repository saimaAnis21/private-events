class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', inverse_of: 'creator'
end
