class CreateItemsBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :items_brands do |t|
      t.references :item, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
