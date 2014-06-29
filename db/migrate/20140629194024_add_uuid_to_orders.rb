class AddUuidToOrders < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.string :uuid
  	end
  end
end
