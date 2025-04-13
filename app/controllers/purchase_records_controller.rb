class PurchaseRecordsController < ApplicationController
  def new
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(purchase_record_delivery_address_params)
    if @purchase_record_delivery_address.valid?
       @purchase_record_delivery_address.save
       redirect to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_delivery_address_params
    params.require(:purchase_record_delivery_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(purchase_record_id: purchase_record.id)
  end
end
