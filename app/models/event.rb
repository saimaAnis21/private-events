class Event < ApplicationRecord
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true
  validates :date, presence: true

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ? ', DateTime.now) }
end
