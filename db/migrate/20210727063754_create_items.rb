class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :condition
      t.boolean :availability, null: false, default: true
      t.integer :deposit
      t.integer :price_per_day

      t.timestamps
    end
  end
end
