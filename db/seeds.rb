Booking.destroy_all
Game.destroy_all
User.destroy_all

user_one = User.create(email: 'cy@pm.me', password: "123456", first_name: "cy", last_name: "porteous")
user_two = User.create(email: 'lucy@pm.me', password: "123456", first_name: "lucy", last_name: "porter")
user_three = User.create(email: 'mike@pm.me', password: "123456", first_name: "mike", last_name: "port")
user_four = User.create(email: 'grace@pm.me', password: "123456", first_name: "grace", last_name: "porton")

game_a = Game.create!(name:"Sonic the Hedgehog", console: "Mega Drive", year: 1991, price_per_day: 2, genre: "Action", user: user_one)
game_b = Game.create(name:"Super Marioworld", console: "Super Nintendo", year: 1991, price_per_day: 2, genre: "Action", user: user_one )
game_c = Game.create(name:"The Legend of Zelda", console: "Super Nintendo", year: 1992, price_per_day: 2, genre: "Fantasy", user: user_two)
game_d = Game.create(name:"Wonder Boy", console: "Master System", year: 1986, price_per_day: 4, genre: "Adventure", user: user_two)
game_e = Game.create(name:"Pac-Man", console: "Atari", year: "1980", price_per_day: 3, genre: "Arcade", user: user_three)
game_f = Game.create(name:"Street Fighter", console: "Super Nintendo", year: 1994, price_per_day: 3, genre: "Combat", user: user_three)
game_g = Game.create(name:"Tertris", console: "Super Nintendo", year: 1990, price_per_day: 3, genre: "Puzzle", user: user_four)
game_h = Game.create(name:"Mortal Combat", console: "Mega Drive", year: 1996, price_per_day: 3, genre: "Combat", user: user_four)

Booking.create!(start_date: '1/3/2024', end_date: '10/3/2024', total_price: 20, confirmed: true, user: user_one, game: game_a)
Booking.create!(start_date: '1/4/2024', end_date: '10/4/2024', total_price: 30, confirmed: true, user: user_one, game: game_b)
Booking.create!(start_date: '1/6/2024', end_date: '10/6/2024', total_price: 40, confirmed: false, user: user_two, game: game_c)
Booking.create!(start_date: '1/7/2024', end_date: '10/7/2024', total_price: 30, confirmed: true, user: user_three, game: game_e)
Booking.create!(start_date: '11/3/2024', end_date: '21/3/2024', total_price: 20, confirmed: false, user: user_three, game: game_f)
Booking.create!(start_date: '11/3/2024', end_date: '21/3/2024', total_price: 30, confirmed: false, user: user_four, game: game_d)
Booking.create!(start_date: '1/1/2024', end_date: '10/1/2024', total_price: 30, confirmed: true, user: user_three, game: game_a)
Booking.create!(start_date: '1/2/2024', end_date: '10/2/2024', total_price: 20, confirmed: true, user: user_one, game: game_h)
