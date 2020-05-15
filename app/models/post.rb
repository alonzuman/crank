class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :likes
  has_many :comments
  has_many :saves
end
