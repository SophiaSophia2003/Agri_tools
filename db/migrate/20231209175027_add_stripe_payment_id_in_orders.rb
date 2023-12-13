class AddStripePaymentIdInOrders < ActiveRecord::Migration[7.0]
  def change
     add_column :orders, :stripe_payment_id, :string, limit: 255
  end
end
