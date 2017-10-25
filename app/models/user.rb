class User < ApplicationRecord
	has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
	validates :username, presence: true, uniqueness: true
	has_secure_password
end
