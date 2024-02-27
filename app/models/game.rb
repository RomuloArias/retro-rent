class Game < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :console, presence: true, inclusion:
    { in: ["Atari", "Dreamcast", "Game Boy", "Game Boy Advance", "Game Boy Colour", "Game Cube", "Game Gear",
           "Master System","Super Nintendo", "Mega Drive","N64", "NES", "PS1", "PS2", "Sega Saturn", "SNES", "Xbox"],
      message: "%{value} is not a valid console" }
  validates :genre, presence: true, inclusion:
    { in: %w[Action Adventure Arcade Combat Platform Puzzle Strategy],
      message: "%{value} is not a valid genre" }
  validates :price_per_day, presence: true
end
