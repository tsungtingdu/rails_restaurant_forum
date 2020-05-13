# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates_presence_of :name
end
