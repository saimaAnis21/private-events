class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', inverse_of: 'creator'

  validates :user_name, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
