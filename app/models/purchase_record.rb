class PurchaseRecord < ApplicationRecord
  has_one :delivery_address
end
