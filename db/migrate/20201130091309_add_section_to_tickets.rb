class AddSectionToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :section, :string
  end
end
