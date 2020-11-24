class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :category
      t.string :sku

      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
