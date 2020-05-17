class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  acts_as_taggable_on :categories
  has_many :likes
  has_many :comments
  has_many :saves
end

# How to limit file sizes for videos