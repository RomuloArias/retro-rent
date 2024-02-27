Game.destroy_all
User.destroy_all

user_one = User.create(email: 'cy@pm.me', password: "123456", first_name: "cy", last_name: "porteous")
user_two = User.create(email: 'lucy@pm.me', password: "123456", first_name: "lucy", last_name: "porter")
user_three = User.create(email: 'mike@pm.me', password: "123456", first_name: "mike", last_name: "port")
user_four = User.create(email: 'grace@pm.me', password: "123456", first_name: "grace", last_name: "porton")

Game.create!(name:"Sonic the Hedgehog", console: "Mega Drive", year: 1991, price_per_day: 2, genre: "Action", user: user_one)
Game.create(name:"Super Marioworld", console: "Super Nintendo", year: 1991, price_per_day: 2, genre: "Action", user: user_one )
Game.create(name:"The Legend of Zelda", console: "Super Nintendo", year: 1992, price_per_day: 2, genre: "Fantasy", user: user_two)
Game.create(name:"Wonder Boy", console: "Master System", year: 1986, price_per_day: 4, genre: "Adventure", user: user_two)
Game.create(name:"Pac-Man", console: "Atari", year: "1980", price_per_day: 3, genre: "Arcade", user: user_three)
Game.create(name:"Street Fighter", console: "Super Nintendo", year: 1994, price_per_day: 3, genre: "Combat", user: user_three)
Game.create(name:"Tertris", console: "Super Nintendo", year: 1990, price_per_day: 3, genre: "Puzzle", user: user_four)
Game.create(name:"Mortal Combat", console: "Mega Drive", year: 1996, price_per_day: 3, genre: "Combat", user: user_four)
