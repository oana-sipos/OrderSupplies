class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :user_id
      t.date :delivery_date

      t.timestamps
    end
  end
end
