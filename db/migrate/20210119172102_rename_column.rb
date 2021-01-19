class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :client_firstname, :client_identifier
  end
end
