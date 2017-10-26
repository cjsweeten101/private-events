class User < ApplicationRecord
	has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
	has_many :event_attendees
	has_many :attended_events, :through => :event_attendees, source: :event 
	validates :username, presence: true, uniqueness: true
	has_secure_password

	def upcoming_events
		attended_events.where("date > ?", Date.today)
	end

	def previous_events
		attended_events.where("date < ?", Date.today)
	end
end

