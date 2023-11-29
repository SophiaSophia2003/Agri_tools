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
categories = [{name: "Electronics",description: "Electronics"},{name: "Clothing",description:"Clothing description"},{name: "Books",description:"Books description"}]
products = [{name: "T-shirt",description: "Comfortable cotton T-shirt",price: 10,stock_quantity: 200},{name: "Jean's",description:"jean's description",stock_quantity:20,price:80},{name: "Baby pant",description:"baby pant description",price: 200,stock_quantity:10},{name: "t-shirt",description:"t-shirt description",price:32,stock_quantity:21},{name: "formal",description:"formal description",price:43,stock_quantity:200},{name: "Programming Book",description:"Programming Book description",price:43.99,stock_quantity:200}]
 tax = Tax.create(name: 'shirt tax',rate: 10)
categories.each do |cat|
	cat = Category.create(name: cat[:name], description: cat[:description], administrator_id: admin.id)
	products.each do |product|
	  prod = Product.create(name: product[:name], description: product[:description], price: product[:price], stock_quantity: product[:stock_quantity], category_id: cat.id, administrator_id: admin.id) 
	  ProductTax.create(product_id: prod.id,tax_id: tax.id)
	end

end


