class ChangeDataEndDateToReservations < ActiveRecord::Migration[6.1]
  def up
    change_column :reservations, :end_date, :date
  end
end
