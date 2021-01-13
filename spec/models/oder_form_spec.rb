require 'rails_helper'

RSpec.describe OderForm, type: :model do
  before do
    @oder_form = FactoryBot.build(:oder_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@oder_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @oder_form.postal_code = ''
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it 'postal_codeがハイフンがないと登録できない' do
        @oder_form.postal_code = '1234567'
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空では登録できない' do
        @oder_form.prefecture_id = 1
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prefecture_idが空では登録できない2' do
        @oder_form.prefecture_id = nil
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'municipalityが空では登録できない' do
        @oder_form.municipality = ''
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @oder_form.address = ''
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @oder_form.phone_number = ''
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it 'phone_numberはハイフンがあり12桁以上だと登録できない' do
        @oder_form.phone_number = '090-1234-5678'
        @oder_form.valid?
        expect(@oder_form.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end   
end
