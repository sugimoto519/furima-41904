require 'rails_helper'

RSpec.describe PurchaseRecordDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_delivery_address = FactoryBot.build(:purchase_record_delivery_address, user_id: @user.id, item_id: @item.id)
  end
  describe '配送先住所登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @purchase_record_delivery_address.postal_code = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角数字でなければ保存できない' do
        @purchase_record_delivery_address.postal_code = '１２３-４５６７'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号には-が含まれていないと保存できない' do
        @purchase_record_delivery_address.postal_code = '1234567'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと登録できない' do
        @purchase_record_delivery_address.prefecture_id = 0
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @purchase_record_delivery_address.city = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @purchase_record_delivery_address.block_number = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @purchase_record_delivery_address.phone_number = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁未満では保存できない' do
        @purchase_record_delivery_address.phone_number = '090123456'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it '電話番号は11桁を超えると保存できない' do
        @purchase_record_delivery_address.phone_number = '090123456789'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空では保存できない' do
        @purchase_record_delivery_address.token = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
