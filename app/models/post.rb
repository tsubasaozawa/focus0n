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

  def save_categories(categories)
    current_categories = self.tags.pluck(:tag) unless self.tags.nil?
    old_categories = current_categories - categories
    new_categories = categories - current_categories

    # Destroy old taggings:
    old_categories.each do |old_name|
      self.tags.delete Tags.find_by(tag:old_name)
    end

    # Create new taggings:
    new_categories.each do |new_name|
      post_tag = Tag.find_or_create_by(tag:new_name)
      self.tags << post_tag
    end
  end
end
