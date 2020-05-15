# frozen_string_literal: true

class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: 'User'
end
