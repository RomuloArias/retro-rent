class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :content, presence: true, length: {minimum: 4, too_short: "%{count} characters is too short", maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
