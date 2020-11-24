class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :status
      t.string :client_firstname

      t.references :user, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.timestamps
    end
  end
end
