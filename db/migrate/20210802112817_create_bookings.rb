class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :item, null: false, foreign_key: true
      t.references :requesting_user, null: false, foreign_key: {to_table: :users}
      t.integer :status, null: false, default: 1
      t.integer :no_of_days
      t.date :start_date

      t.timestamps
    end
  end
end
