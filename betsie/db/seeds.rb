# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: 'Bob', password: 'password' },
  { username: 'Jennifer', password: 'password' },
  { username: 'Sam', password: 'password' },
  { username: 'Crazy Eyes', password: 'password' },
  { username: 'Realy Old Guy', password: 'password' },
  { username: 'Papa Smurf', password: 'password' },
  { username: 'Inspector Gadget', password: 'password' },
  { username: 'Sasquatch', password: 'password' },
  { username: 'Shaggy', password: 'password' },
  { username: 'Road Runner', password: 'password' },
  { username: 'Jerry', password: 'password' },
  { username: 'Minne Mouse', password: 'password' },
  { username: 'Kroll the Warrior King', password: 'password' },
  { username: 'The Black Knight', password: 'password' }
])

wagers = Wager.create([
  { name: 'Stay silent the longest' },
  { name: 'Run the fastest' },
  { name: 'Type the fastest' },
  { name: 'Get the highest score' },
  { name: 'Stay alive the longest' },
  { name: 'Lift the most' },
  { name: 'First to score points' },
  { name: 'Get home first' },
  { name: 'Get the best time' },
  { name: 'Team will win the most games' },
  { name: 'Sell the most' },
  { name: 'Make the most money' },
  { name: 'First to win 5 matches' },
  { name: 'Roshambo best of 5' },
  { name: 'Solve puzzle the fastest' },
  { name: "Get someone's phone number" },
  { name:  "Complete the Saltine cracker challenge" }
])

payments = Payment.create([
  { name: 'Ride in the back' },
  { name: 'Put shirt on backwards' },
  { name: 'Shave their head' },
  { name: 'Clean up' },
  { name: "Sing 'Barbie Girl' at Karoake" },
  { name: 'Do the chicken dance' }
])

challenges = Challenge.create([
  { user_id: 2, challenger_id: 9, wager_id: 8, payment_id: 4, date: Time.now, status: 'accepted' },
  { user_id: 5, challenger_id: 9, wager_id: 1, payment_id: 1, date: Time.now, status: 'accepted' },
  { user_id: 7, challenger_id: 3, wager_id: 9, payment_id: 4, date: Time.now, status: 'completed' },
  { user_id: 8, challenger_id: 2, wager_id: 4, payment_id: 4, date: Time.now, status: 'accepted' },
  { user_id: 4, challenger_id: 2, wager_id: 5, payment_id: 1, date: Time.now, status: 'pending' },
  { user_id: 3, challenger_id: 1, wager_id: 6, payment_id: 2, date: Time.now, status: 'accepted' },
  { user_id: 2, challenger_id: 1, wager_id: 6, payment_id: 9, date: Time.now, status: 'pending' },
  { user_id: 2, challenger_id: 5, wager_id: 8, payment_id: 9, date: Time.now, status: 'completed' },
  { user_id: 6, challenger_id: 5, wager_id: 7, payment_id: 7, date: Time.now, status: 'accepted' },
  { user_id: 9, challenger_id: 6, wager_id: 7, payment_id: 7, date: Time.now, status: 'completed' },
  { user_id: 9, challenger_id: 6, wager_id: 9, payment_id: 7, date: Time.now, status: 'accepted' },
  { user_id: 1, challenger_id: 10, wager_id: 2, payment_id: 6, date: Time.now, status: 'pending' },
  { user_id: 1, challenger_id: 10, wager_id: 1, payment_id: 5, date: Time.now, status: 'accepted' },
])
