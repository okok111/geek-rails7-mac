class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } 
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations, dependent: :destroy
end
