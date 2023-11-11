class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
         validates :email,              presence: true, uniqueness: true, format: { with: /\A\S+@\S+\z/, message: "は@を含む入力をしてください" }
         validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "は半角英字と数字の両方を含む必要があります" }
         validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角文字のみで入力してください" }
         validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角文字のみで入力してください" }
         validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
         validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
         validates :birthdate,          presence: true
end
