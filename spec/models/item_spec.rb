require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
  
    context '商品出品できる場合' do
  
     it '全ての項目が入力されていれば登録できる' do
      expect(@item).to be_valid
     end
    end

    context '商品出品できない場合' do
      
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが---では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選んでください！")
      end

      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態が---では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を選んでください！")
      end

      it '配送料の負担が空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '配送料の負担が---では登録できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost を選んでください！")
      end

      it '発送元の地域の情報が空では登録できない' do
        @item.origin_region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin region can't be blank")
      end

      it '発送元の地域の情報が---では登録できない' do
        @item.origin_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin region を選んでください！")
      end

      it '発送までの日数が空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '発送までの日数が---では登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day を選んでください！")
      end


      it '価格が空では登録できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it '価格が全角では登録できない' do
        @item.cost = '７７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は¥300から¥9,999,999の範囲で半角数値を入力してください!")
      end

      it '価格が英字では登録できない' do
        @item.cost = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は¥300から¥9,999,999の範囲で半角数値を入力してください!")
      end

      it '価格が￥300以下では登録できない' do
        @item.cost = '7'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は¥300から¥9,999,999の範囲で半角数値を入力してください!")
      end

      it '価格が¥9,999,999以上では登録できない' do
        @item.cost = '999,999,999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は¥300から¥9,999,999の範囲で半角数値を入力してください!")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
