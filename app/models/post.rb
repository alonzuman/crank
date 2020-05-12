class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  acts_as_taggable_on :categories
end
