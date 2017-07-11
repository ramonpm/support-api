class AddFinishedAtToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :finished_at, :timestamp
  end
end
