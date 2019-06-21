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

admin = User.create!(email: "test@test.com", first_name: "Admin",
   last_name: "Admin", password: "password", password_confirmation: "password")
admin.save

20.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@hotmail.com"
  user = User.create!(email: email, last_name: last_name,
     first_name: first_name, password: "password",
      password_confirmation: "password")
  user.save
  if (n < 10)
    Friendship.create(user: admin, friend: user)
  end
end

second = User.second
5.times do |n|
  UserStock.create(user: admin, stock: stocks_array[n])
  UserStock.create(user: second, stock: stocks_array[n])
end
