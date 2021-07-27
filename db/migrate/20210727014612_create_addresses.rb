class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_no
      t.string :street
      t.string :suburb
      t.string :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
