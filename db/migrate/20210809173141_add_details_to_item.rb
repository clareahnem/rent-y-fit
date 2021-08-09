class AddDetailsToItem < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:items, :availability, from: true, to: TRUE)
  end
end
