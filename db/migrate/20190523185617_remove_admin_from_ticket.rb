class RemoveAdminFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :admin, :boolean
  end
end
