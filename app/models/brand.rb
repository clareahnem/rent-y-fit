class Brand < ApplicationRecord
    has_many :items_brands, dependent: :destroy
    has_many :items, through: :items_brands

    # data validations
    validates :name, presence: true
end
