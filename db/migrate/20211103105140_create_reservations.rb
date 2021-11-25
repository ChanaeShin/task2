class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id ,:null =>  false
      t.integer :user_id ,:null =>  false
      t.date :start_date ,:null =>  false
      t.date :end_date ,:null =>  false
      t.integer :total_amount,:null =>  false

      t.timestamps
    end
  end
end
