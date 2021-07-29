class ItemsBrand < ApplicationRecord
  belongs_to :item
  belongs_to :brand
  accepts_nested_attributes_for :brand, reject_if: :all_blank
end
