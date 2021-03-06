class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # POSTS
  has_many :posts

  # LIKES
  has_many :likes, dependent: :destroy

  # COMMENTS
  has_many :comments

  # SAVES
  has_many :saves

  has_one_attached :image

  # FOLLOWS
  # To view a users followers, call user.followers 
  # To view users followed by user, call user.followings
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :given_follows, source: :followed_user
end
