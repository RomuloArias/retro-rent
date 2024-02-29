require 'open-uri'
require 'json'

puts "removing old data..."
Booking.destroy_all
Game.destroy_all
User.destroy_all

puts "creating users..."
user_one = User.create!(email: 'cy@pm.me', password: "123456", first_name: "Cy", last_name: "Porteous")
user_two = User.create!(email: 'rom@pm.me', password: "123456", first_name: "Rom", last_name: "Porter")
user_three = User.create!(email: 'mike@pm.me', password: "123456", first_name: "Mike", last_name: "Magic")
user_four = User.create!(email: 'grace@pm.me', password: "123456", first_name: "Grace", last_name: "Porton")
user_five = User.create!(email: 'toren@pm.me', password: "123456", first_name: "Toren", last_name: "Porton")

puts "creating games..."
api_key = '8bf1a4825f3014203e646d9481076557a0352892'
base_url = 'https://www.giantbomb.com/api/'
page = 0
endpoint = "#{base_url}games?api_key=#{api_key}&format=json"
response = URI.open(endpoint).read
result = JSON.parse(response, symbolize_names: true)
result[:results].each do |game|
  unless game[:platforms][0][:name].in?(Game::CONSOLES)
    next
  end

  # https://www.giantbomb.com/api/games?api_key=8bf1a4825f3014203e646d9481076557a0352892&format=json

  Game.create!(
    console: game[:platforms][0][:name],
    description: game[:image][:description],
    # genre: game[:genre]
    image_url: game[:image][:original_url],
    name: game[:name],
    price_per_day: (1..5).to_a.sample,
    user: [user_one, user_two, user_three, user_four].sample,
    year: game[:original_release_date].present? ? Date.parse(game[:original_release_date]).year : game[:expected_release_year]
  )
end

while Game.count < 20
  page += 1

  endpoint = "#{base_url}games?api_key=#{api_key}&format=json&offset=#{page * 100}"
  response = URI.open(endpoint).read
  result = JSON.parse(response, symbolize_names: true)
  result[:results].each do |game|
    unless game[:platforms][0][:name].in?(Game::CONSOLES)
      next
    end

    Game.create!(
      console: game[:platforms][0][:name],
      # genre: game[:genre]
      image_url: game[:image][:original_url],
      name: game[:name],
      price_per_day: (1..5).to_a.sample,
      user: [user_one, user_two, user_three, user_four].sample,
      year: game[:original_release_date].present? ? Date.parse(game[:original_release_date]).year : game[:expected_release_year]
    )
  end
end

games = Game.all
puts "creating bookings..."
Booking.create!(start_date: '1/3/2024', end_date: '10/3/2024', total_price: 20, confirmed: true, user: user_one, game: games.sample)
Booking.create!(start_date: '1/4/2024', end_date: '10/4/2024', total_price: 30, confirmed: true, user: user_one, game: games.sample)
Booking.create!(start_date: '1/6/2024', end_date: '10/6/2024', total_price: 40, confirmed: false, user: user_two, game: games.sample)
Booking.create!(start_date: '1/7/2024', end_date: '10/7/2024', total_price: 30, confirmed: true, user: user_three, game: games.sample)
Booking.create!(start_date: '11/3/2024', end_date: '21/3/2024', total_price: 20, confirmed: false, user: user_three, game: games.sample)
Booking.create!(start_date: '11/3/2024', end_date: '21/3/2024', total_price: 30, confirmed: false, user: user_four, game: games.sample)
Booking.create!(start_date: '1/1/2024', end_date: '10/1/2024', total_price: 30, confirmed: true, user: user_three, game: games.sample)
Booking.create!(start_date: '1/2/2024', end_date: '10/2/2024', total_price: 20, confirmed: true, user: user_one, game: games.sample)

# game_a = Game.create!(name: "Sonic the Hedgehog", console: "Mega Drive", year: 1991, price_per_day: 2, genre: "Action", user: user_one)
# game_b = Game.create!(name: "Super Mario World", console: "Super Nintendo", year: 1991, price_per_day: 2, genre: "Action", user: user_one )
# game_c = Game.create!(name: "The Legend of Zelda", console: "Super Nintendo", year: 1992, price_per_day: 2, genre: "Fantasy", user: user_two)
# game_d = Game.create!(name: "Wonder Boy", console: "Master System", year: 1986, price_per_day: 4, genre: "Adventure", user: user_two)
# game_e = Game.create!(name: "Pac-Man", console: "Atari", year: "1980", price_per_day: 3, genre: "Arcade", user: user_three)
# game_f = Game.create!(name: "Street Fighter", console: "Super Nintendo", year: 1994, price_per_day: 3, genre: "Combat", user: user_three)
# game_g = Game.create!(name: "Tetris", console: "Super Nintendo", year: 1990, price_per_day: 3, genre: "Puzzle", user: user_four)
# game_h = Game.create!(name: "Mortal Combat", console: "Mega Drive", year: 1996, price_per_day: 3, genre: "Combat", user: user_four)
