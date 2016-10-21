class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :attendees
  has_many :attending_users, through: :attendees, source: :user
  has_many :comments_from_users, through: :comments, source: :user
  validates :name, :location, :state, :date, presence: true
  validates :state, length: {is: 2}
  validate :event_future_date

  def event_future_date
  	errors.add(:date, "cant be in the past") if !date.blank? and date < Date.today
  end
  #http://guides.rubyonrails.org/v2.3.11/activerecord_validations_callbacks.html#creating-custom-validation-methods
end
