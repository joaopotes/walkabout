class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_time
      t.date :end_time
      t.references :user, null: false, foreign_key: true
      t.references :excursion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
