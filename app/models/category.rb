class Category < ApplicationRecord
    has_many :items

    # data validations
    validates :name, presence: true
end
