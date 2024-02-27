class Game < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :console, presence: true, inclusion:
    { in: [:Atari, :Dreamcast, :Game_Boy, :Game_Boy_Advance, :Game_Boy_Colour, :GameCube, :Game_Gear, :Master_System, :Mega_Drive, :N64, :NES, :PS1, :PS2, :Sega_Saturn, :SNES, :Xbox],
      message: "%{value} is not a valid console" }
  validates :genre, presence: true, inclusion:
    { in: %w[action adventure arcade combat platform puzzle strategy],
      message: "%{value} is not a valid genre" }
  validates :price_per_day, presence: true
end
