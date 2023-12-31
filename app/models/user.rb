class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

         validates :nickname,           presence: true
         validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角文字のみで入力してください" }
         validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角文字のみで入力してください" }
         validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
         validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
         validates :birthdate,          presence: true

         has_many :items
         has_many :orders
end
