json.extract! item, :id, :user_id, :category_id, :name, :description, :condition, :availability, :deposit, :price_per_day, :created_at, :updated_at
json.url item_url(item, format: :json)
