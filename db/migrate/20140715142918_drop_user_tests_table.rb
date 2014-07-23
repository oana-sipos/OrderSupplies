class DropUserTestsTable < ActiveRecord::Migration
  def change
  	drop_table :user_tests
  end
end
