class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.integer :article_id
      t.string :address
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
