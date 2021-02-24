class EventAttendee < ApplicationRecord
    
    belongs_to :event_user, class_name: "User"
    belongs_to :user_event, class_name: "Event"

end
