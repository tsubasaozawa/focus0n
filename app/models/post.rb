class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :text, presence: true
  validates :code, presence: true
  validates :image, presence: true
  validates :title, presence: true
  # マイグレーションファイルでnull:falseにしたカラムには必ずvalidatesを明示する

  mount_uploader :image, ImageUploader
end
