class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block_number
    validates :phone_number
    validates :purchase_record_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user.id, item_id: item.id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end