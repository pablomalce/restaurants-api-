puts "start seed"

user = User.find_or_initialize_by(email: 'pablo@malczewski.com')
user.password = 'password'
user.password_confirmation = 'password'

restaurant = user.restaurants.find_or_initialize_by(name: 'Belagambas', address: 'Armenia St' )
restaurant2 = user.restaurants.find_or_initialize_by(name: 'Tipo 7', address: 'Niceto Vega Av.' )
restaurant3 = user.restaurants.find_or_initialize_by(name: 'La Gitarrita', address: 'Armenia St' )

user.save

user2 = User.find_or_initialize_by(email: 'juan@dominguez.com')
user2.password = 'password'
user2.password_confirmation = 'password'

restaurant = user2.restaurants.find_or_initialize_by(name: 'La Francisca', address: 'Armenia St' )

user2.save

puts "end seed"
