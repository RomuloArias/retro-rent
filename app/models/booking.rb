class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :start_date, presence: true
  validates :end_date, presence: true

  def booking_duration
    (end_date-start_date).to_i
  end
end
