class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(purchase_record_delivery_address_params)
    if @purchase_record_delivery_address.valid?
      pay_item
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_delivery_address_params
    params.require(:purchase_record_delivery_address).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_record_delivery_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return unless current_user.id == @item.user_id || current_user.id && @item.purchase_record.present?

    redirect_to root_path
  end
end
