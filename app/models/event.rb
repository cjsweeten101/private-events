class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	has_many :event_attendees, dependent: :destroy
	has_many  :attendees, :through => :event_attendees, source: :user
	validates :title, presence: true
	validates :date, presence: true
	validates :location, presence: true
	validates :description, presence: true

	scope :past, -> { where("date < ?", Date.today) }
	scope :upcoming, -> { where("date > ?", Date.today) }
end
