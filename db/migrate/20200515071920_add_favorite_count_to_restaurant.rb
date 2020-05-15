# frozen_string_literal: true

class AddFavoriteCountToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :favorites_count, :integer, default: 0

    Restaurant.pluck(:id).each do |i|
      Restaurant.reset_counters(i, :favorites)
    end
  end
end
