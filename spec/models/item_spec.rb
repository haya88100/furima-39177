require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '新規登録できる場合' do
      it "全てが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "価格が300 ~ 9,999,999円の範囲内であれば登録できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "memoが空では登録できない" do
        @item.memo = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Memo can't be blank")
      end

      it "status_idが1では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "chage_bearer_idが1では登録できない" do
        @item.chage_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Chage bearer must be other than 1")
      end
      
      it "shopping_area_idが1では登録できない" do
        @item.shopping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping area must be other than 1")
      end
      
      it "delivary_day_idが1では登録できない" do
        @item.delivary_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary day must be other than 1")
      end
    
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "imageが添付されていない場合は登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "価格が300未満の場合は登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9,999,999より大きい場合は登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "金額は全角数字では保存できない" do
        @item.price = '１０００' # 全角数字
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "userが紐づいていなければ保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "価格が空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end