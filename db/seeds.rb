# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
# # Product.destroy_all
# # Category.destroy_all
# # admin = Administrator.create(active: true, first_name: 'test', last_name: 'example', email: 'test2@example.com', password: '123123123',password_confirmation: ''123123123)
# # categories = [{name: "Gardaning",description: "Gardaning"},{name: "Harvesting tools",description:"Harvesting tools"},{name: "Seeders",description:"Seeders description"}]

# # categories.each do |cat|
# # 	cat = Category.create(name: cat[:name], description: cat[:description], administrator_id: admin.id)

# # end
# # products = [{name: "Shovel",description: "Shovel description",price: 10,stock_quantity: 200,category_id: 1},{name: "Spade",description:"Spade description",stock_quantity:20,price:80,category_id: 1},{name: "Walk behind cultivators",description:"Walk behind cultivators description",price: 200,stock_quantity:10,category_id: 2},{name: "Sickli",description:"Sickli description",price:32,stock_quantity:21,category_id: 2},{name: "Scythe",description:"Scythe description",price:43,stock_quantity:200,category_id: 3},{name: "Rake",description:"Rake description",price:43.99,stock_quantity:200,category_id: 3}]
# # tax = Tax.create(name: 'shirt tax',rate: 10)
# # products.each do |product|
# #   prod = Product.create(name: product[:name], description: product[:description], price: product[:price], stock_quantity: product[:stock_quantity], category_id: product[:category_id], administrator_id: admin.id)
# #   ProductTax.create(product_id: prod.id,tax_id: tax.id)
# # end

# # provinces = [{ name: 'Alberta', gst_rate: 0.05, pst_rate: 0.0, hst_rate: 0.0 },{ name: 'British Columbia', gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.0 }]

# # Province.create(province)


require 'faker'

2.times do
  password = Faker::Internet.password(min_length: 12)
  admin = Administrator.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    active: true
  )
    puts "#{admin.email} : #{password}"
end

# Define the number of categories you want to create
num_categories = 10

# Seed data for e-commerce categories
num_categories.times do
  Category.create(name: Faker::Commerce.unique.department)
end

# # Define a method to generate a random tax rate
def random_tax_rate
  Faker::Number.decimal(l_digits: 2)
end

# Seed data for Canada provinces
  # provinces_data = [
  #   { name: 'Alberta', gst_rate: random_tax_rate, pst_rate: random_tax_rate, hst_rate: '0.00' },
  #   { name: 'British Columbia', gst_rate: random_tax_rate, pst_rate: random_tax_rate, hst_rate: '0.00' },
  #   { name: 'Manitoba', gst_rate: random_tax_rate, pst_rate: random_tax_rate, hst_rate: '0.00' },
  #   { name: 'New Brunswick', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: random_tax_rate },
  #   { name: 'Newfoundland and Labrador', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: random_tax_rate },
  #   { name: 'Nova Scotia', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: random_tax_rate },
  #   { name: 'Ontario', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: random_tax_rate },
  #   { name: 'Prince Edward Island', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: random_tax_rate },
  #   { name: 'Quebec', gst_rate: random_tax_rate, pst_rate: '0.00', hst_rate: '0.00' },
  #   { name: 'Saskatchewan', gst_rate: random_tax_rate, pst_rate: random_tax_rate, hst_rate: '0.00' }
  # ]

provinces_data = [
  {
    "name": "Alberta",
    "name_abbreviation": "AB",
    "gst": 0.05,
    "pst": 0.0,
    "hst": 0.0
  },
  {
    "name": "British Columbia",
    "name_abbreviation": "BC",
    "gst": 0.05,
    "pst": 0.07,
    "hst": 0.0
  },
  {
    "name": "Manitoba",
    "name_abbreviation": "MB",
    "gst": 0.05,
    "pst": 0.07,
    "hst": 0.0
  },
  {
    "name": "New Brunswick",
    "name_abbreviation": "NB",
    "gst": 0.0,
    "pst": 0.0,
    "hst": 0.15
  },
  {
    "name": "Newfoundland and Labrador",
    "name_abbreviation": "NL",
    "gst": 0.0,
    "pst": 0.0,
    "hst": 0.15
  },
  {
    "name": "Nova Scotia",
    "name_abbreviation": "NT",
    "gst": 0.05,
    "pst": 0.0,
    "hst": 0.0
  },
  {
    "name": "Northwest Territories",
    "name_abbreviation": "NS",
    "gst": 0.0,
    "pst": 0.0,
    "hst": 0.15
  },
  {
    "name": "Nunavut",
    "name_abbreviation": "NU",
    "gst": 0.05,
    "pst": 0.0,
    "hst": 0.0
  },
  {
    "name": "Ontario",
    "name_abbreviation": "ON",
    "gst": 0.0,
    "pst": 0.0,
    "hst": 0.13
  },
  {
    "name": "Prince Edward Island",
    "name_abbreviation": "PE",
    "gst": 0.0,
    "pst": 0.0,
    "hst": 0.15
  },
  {
    "name": "Quebec",
    "name_abbreviation": "QC",
    "gst": 0.05,
    "pst": 0.09975,
    "hst": 0.0
  },
  {
    "name": "Saskatchewan",
    "name_abbreviation": "SK",
    "gst": 0.05,
    "pst": 0.06,
    "hst": 0.0
  },
  {
    "name": "Yukon",
    "name_abbreviation": "YT",
    "gst": 0.05,
    "pst": 0.0,
    "hst": 0.0
  }
]

provinces_data.each do |province|
  Province.create(name: province[:name],gst_rate:  province[:gst_rate],pst_rate:  province[:pst_rate],hst_rate:  province[:hst_rate])
end

# Seed customers with addresses
10.times do
  customer_password = Faker::Internet.password(min_length: 12)
  customer = Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: customer_password,
    password_confirmation: customer_password,
    phone_number: Faker::PhoneNumber.phone_number,
    province_id: Province.pluck(:id).sample
  )
   puts "#{customer.email} : #{customer_password}"


  Address.create(
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    zip_code: Faker::Address.postcode,
    customer_id: customer.id,
    address_type: "OFFICE"
  )
end

# Seed products
values_array = ["NEW", "SALE","RECENTLY"]
200.times do
  product = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    stock_quantity:  Faker::Number.decimal(l_digits: 2, r_digits: 2),
    category_id: Category.pluck(:id).sample,
    product_type:   values_array.sample,
    # image_url: Faker::LoremPixel.image(size: '300x200', category: 'technics', randomize: true)
    thumbnail: Faker::Placeholdit.image(size: '300x200', format: 'jpg', background_color: Faker::Color.hex_color[1..-1], text_color: Faker::Color.hex_color[1..-1], text: 'Product Image')
  )
  puts product.thumbnail

  ProductImage.create(product_id: product.id,image: Faker::Placeholdit.image(size: '300x200', format: 'jpg', background_color: Faker::Color.hex_color[1..-1], text_color: Faker::Color.hex_color[1..-1], text: 'Product Image'))
end

200.times do
  Categorization.create(product_id: Product.pluck(:id).sample,category_id: Category.pluck(:id).sample)
end
