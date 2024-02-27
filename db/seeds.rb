Game.destroy_all
User.destroy_all

user_one = User.create(email: 'cy@pm.me', password: "123456", first_name: "cy", last_name: "porteous")
user_two = User.create(email: 'lucy@pm.me', password: "123456", first_name: "lucy", last_name: "porter")
user_three = User.create(email: 'mike@pm.me', password: "123456", first_name: "mike", last_name: "port")
user_four = User.create(email: 'grace@pm.me', password: "123456", first_name: "grace", last_name: "porton")

Game.create!(name:"sonic the hedgehog", console: "sega megadrive", year: 1991, price_per_day: 2, genre: "action", user: user_one)
Game.create(name:"super marioworld", console: "super nintendo", year: 1991, price_per_day: 2, genre: "action", user: user_one )
Game.create(name:"the legend of zelda", console: "super nintendo", year: 1992, price_per_day: 2, genre: "fantasy", user: user_two)
Game.create(name:"wonder boy", console: "sega mastersystem", year: 1986, price_per_day: 4, genre: "adventure", user: user_two)
Game.create(name:"pac-man", console: "atari", year: "1980", price_per_day: 3, genre: "retro", user: user_three)
Game.create(name:"street fighter", console: "super nintendo", year: 1994, price_per_day: 3, genre: "combat", user: user_three)
Game.create(name:"tertris", console: "super nintendo", year: 1990, price_per_day: 3, genre: "puzzle", user: user_four)
Game.create(name:"mortal combat", console: "sega megadrive", year: 1996, price_per_day: 3, genre: "combat", user: user_four)
