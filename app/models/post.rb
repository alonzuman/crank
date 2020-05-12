class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :likes
  belongs_to :saves
end
