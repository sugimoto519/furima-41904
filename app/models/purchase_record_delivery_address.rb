class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid' }, length: { minimum: 10, maximum: 11 }
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number,
                           building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
