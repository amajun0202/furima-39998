require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
     
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do

      it '郵便番号が空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '発送元の地域の情報が空では登録できない' do
        @order_address.origin_region_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Origin region can't be blank")
      end

      it '発送元の地域の情報が---では登録できない' do
        @order_address.origin_region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Origin region can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では登録できない' do
        @order_address.phone_number = '999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
      @order_address.phone_number = '999999999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it '電話番号に半角数字以外の文字が含まれている場合登録できない' do
        @order_address.phone_number = '9999999999a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end

      it 'ユーザーが紐づいていない場合登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品情報が紐づいていない場合登録出来ない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      
    end
  end
end