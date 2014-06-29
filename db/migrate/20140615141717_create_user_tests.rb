class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
