class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :receipt_url
      t.string :payment_id

      t.timestamps
    end
  end
end
