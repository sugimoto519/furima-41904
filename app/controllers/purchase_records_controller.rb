class PurchaseRecordsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(purchase_record_delivery_address_params)
    if @purchase_record_delivery_address.valid?
       @purchase_record_delivery_address.save
       redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_delivery_address_params
    params.require(:purchase_record_delivery_address).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
