require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
     it "全てが存在すれば登録できる" do
       expect(@user).to be_valid
     end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが数字のみでは登録できない" do
        @user.password = "012345"
        @user.password_confirmation = "012345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードが英字のみ登録できない" do
        @user.password = "password" 
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードが全角文字を含むものは登録できない" do
        @user.password = "ｐａｓｕｗａｄｏ"
        @user.password_confirmation = "ｐａｓｕｗａｄｏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "名前（姓）が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前（名）が空では登録できない" do
        @user.fast_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name can't be blank")
      end
      it "名前（姓）のフリガナが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名前（姓）のフリガナが全角カタカナでないと登録できない" do
        @user.last_name_kana = "やまだ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名前（名）のフリガナが空では登録できない" do
        @user.fast_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name kana can't be blank")
      end
      it "名前（名）が全角カタカナでないと登録できないこと" do
        @user.fast_name_kana = 'taro' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name kana is invalid")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
