class AddAmountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :amount, :integer
  end
end
