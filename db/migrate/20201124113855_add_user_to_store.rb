class AddUserToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :store, index:true
    add_foreign_key :users, :stores
    add_column :users, :nickname, :string
  end
end
