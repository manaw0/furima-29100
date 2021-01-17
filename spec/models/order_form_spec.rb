require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it 'postal_codeがハイフンがないと登録できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空では登録できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prefecture_idが空では登録できない2' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'municipalityが空では登録できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it 'phone_numberはハイフンがあり12桁以上だと登録できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
