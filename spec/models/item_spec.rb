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

      it "status_idが空では登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "chage_bearer_idが空では登録できない" do
        @item.chage_bearer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Chage bearer can't be blank")
      end

      it "shopping_area_idが空では登録できない" do
        @item.shopping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping area can't be blank")
      end

      it "delivary_day_idが空では登録できない" do
        @item.delivary_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary day can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "userが空では登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが1では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "imageが添付されていない場合は登録できない" do
        @item = FactoryBot.build(:item) # Create a new instance
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
    end
  end
end