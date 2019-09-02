# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers_array = Array.new(6) do |customer|
  Customer.create!(
    name: "Customer_#{ customer + 1 }",
    phone_number: "00000000#{ customer + 1 }",
    description: "Some description")
end
