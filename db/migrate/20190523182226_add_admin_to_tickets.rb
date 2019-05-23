class AddAdminToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :admin, :boolean
  end
end
