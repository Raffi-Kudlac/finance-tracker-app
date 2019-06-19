# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

symbols = %w[AON, AOS, AP, APA, APAM, APC, APD, APH, APHA, APLE, APO, APO-A]
stocks_array = []
symbols.each do |s|
  stocks_array.push(Stock.create(ticker: s, name: "Comp", last_price: 0.00))
end

user = User.create!(email: "test@test.com", password: "password",
    password_confirmation: "password")
user.save

5.times do |n|
  UserStock.create(user: user, stock: stocks_array[n])
end
