class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :article_id
      t.integer :amount

      t.timestamps
    end
  end
end
