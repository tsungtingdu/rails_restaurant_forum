# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :nullify
  has_many :restaurants, through: :comments
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
end
