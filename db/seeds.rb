# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
Category.destroy_all
admin = Administrator.create(active: true, first_name: 'test', last_name: 'example', email: 'test@example.com', encrypted_password: '123123123', password: '123123123')
categories = [{name: "Gardaning",description: "Gardaning"},{name: "Harvesting tools",description:"Harvesting tools"},{name: "Seeders",description:"Seeders description"}]

categories.each do |cat|
	cat = Category.create(name: cat[:name], description: cat[:description], administrator_id: admin.id)

end
products = [{name: "Shovel",description: "Shovel description",price: 10,stock_quantity: 200,category_id: 1},{name: "Spade",description:"Spade description",stock_quantity:20,price:80,category_id: 1},{name: "Walk behind cultivators",description:"Walk behind cultivators description",price: 200,stock_quantity:10,category_id: 2},{name: "Sickli",description:"Sickli description",price:32,stock_quantity:21,category_id: 2},{name: "Scythe",description:"Scythe description",price:43,stock_quantity:200,category_id: 3},{name: "Rake",description:"Rake description",price:43.99,stock_quantity:200,category_id: 3}]
tax = Tax.create(name: 'shirt tax',rate: 10)
products.each do |product|
	  prod = Product.create(name: product[:name], description: product[:description], price: product[:price], stock_quantity: product[:stock_quantity], category_id: product[:category_id], administrator_id: admin.id)
	  ProductTax.create(product_id: prod.id,tax_id: tax.id)
	end