class CreatePaymentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.datetime :payment_date
      t.string :payment_method
      t.decimal :amount
      t.string :transaction_id
      
      t.timestamps
    end
  end
end
