class Blog < ApplicationRecord

  # バリデーション
  validates :image,
    presence: true

  validates :content,
    presence: true,
    length: { in: 1..75 }

  # アソシエーション：多対多の多側
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # アソシエーション設定一対多の多側
  belongs_to :user

  # アソシエーション設定一対多の一側
  has_many :users


end
