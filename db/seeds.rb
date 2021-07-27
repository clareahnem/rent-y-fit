# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Tshirts", "Shorts", "Pants", "Hoods & Crews", "Jackets", "Coats", "Knitwear", "Shirts", "Hats", "Accessories", "Bags", "Dresses", "Setups", "Bundles", "Other"]



if Category.count == 0 
    categories.each do |category| 
        Category.create(name: category)
        puts "created #{category} category"
    end 
end

if User.count == 0
    User.create(username:"Tester", first_name:"First", last_name:"Last", email:"test@test.com", password:"password", password_confirmation:"password", address_attributes:[{street_no:"123", street:"Sydney road", suburb:"Brunswick", postcode:"3056"}])
end