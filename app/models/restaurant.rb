# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def favorited?(user)
    favorited_users.include?(user)
  end

  def liked?(user)
    liked_users.include?(user)
  end
end
