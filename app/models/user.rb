class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, } do
    validates :fast_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/,  } do
    validates :fast_name_kana
    validates :last_name_kana
  end

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/,  }

  
end
