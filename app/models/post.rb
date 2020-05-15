class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :likes
  has_many :comments
  belongs_to :saves
end
