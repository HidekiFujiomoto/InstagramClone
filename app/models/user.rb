class User < ApplicationRecord
  # バリデーション
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  # 保存する前にメールアドレスを小文字に変換
  before_save { email.downcase! }

  # パスワードをハッシュ化
  has_secure_password

  # アソシエーション：多対多の多側
  has_many :favorites, dependent: :destroy

  # アソシエーション設定一対多の一側
  has_many :blogs, dependent: :destroy
end
