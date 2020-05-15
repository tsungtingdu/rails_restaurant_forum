# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :nullify
  has_many :restaurants, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :user

  # find user I follow
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  # find followers
  has_many :inverse_followeship, class_name: 'Followship', foreign_key: 'following_id'
  has_many :followers, through: :inverse_followeship, source: :user
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end

  def following?(user)
    followings.include?(user)
  end
end
