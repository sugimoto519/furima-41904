class PurchaseRecord < ApplicationRecord
  belongs_to :item
  has_one :delivery_address
end
