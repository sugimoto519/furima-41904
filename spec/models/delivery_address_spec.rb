require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    purchase_record = FactoryBot.create(:purchase_record, user: user, item: item)
    @delivery_address = FactoryBot.build(:delivery_address, purchase_record_id: purchase_record.id)
  end
  describe '配送先住所登録' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
      end
      it '郵便番号は半角数字でなければ保存できない' do
      end
      it '郵便番号には-が含まれていないと保存できない' do
      end
      it '都道府県が空だと登録できない' do
      end
      it '市区町村が空だと保存できない' do
      end
      it '番地が空だと登録できない' do
      end
      it '電話番号が空だと登録できない' do
      end
      it '電話番号は10桁以上11桁以内の半角数字でなければ保存できない' do
      end
    end
  end
end
