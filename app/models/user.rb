class User < ApplicationRecord
	has_many :attendees
	has_many :events 
	has_many :comments
	has_many :attending_events, through: :attendees, source: :event
	has_many :comments_on_events, through: :comments, source: :event 
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
	validates :first_name, :last_name, :location, :state, presence: true
	validates :state, length: {is: 2}
	validates :password, length: {minimum: 8}, on: :create
	validates_presence_of :password, on: :create
	validates_confirmation_of :password, :allow_blank => true
end

