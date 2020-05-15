# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_mayn :favorited_users, through: :favorites, source: :user
end
