class Game < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  GENRES = %w[Action Adventure Arcade Combat Fantasy Platform Puzzle Strategy]
  CONSOLES = [
    "Atari",
    "Dreamcast",
    "Game Boy",
    "Game Boy Advance",
    "Game Boy Colour",
    "Game Cube",
    "Game Gear",
    "Master System",
    "Super Nintendo",
    "Mega Drive",
    "Nintendo 64",
    "NES",
    "PlayStation Portable",
    "PlayStation",
    "PlayStation 2",
    "Sega Saturn",
    "Sega Game Gear",
    "SNES",
    "Super Nintendo Entertainment System",
    "Xbox"
  ]
  validates :name, presence: true
  validates :console, presence: true, inclusion:
    { in: CONSOLES,
      message: "%{value} is not a valid console" }
  # validates :genre, presence: true, inclusion:
  #   { in: GENRES,
  #     message: "%{value} is not a valid genre" }
  validates :price_per_day, presence: true

  include PgSearch::Model
  pg_search_scope :searching,
  against: [ :name, :console ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
