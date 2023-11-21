class CreateReviewsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :rating
      t.text :comment
      t.datetime :date_posted

      t.timestamps
    end
  end
end
