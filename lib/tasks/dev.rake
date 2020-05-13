# frozen_string_literal: true

namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    100.times do |_i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: '11:00',
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph
      )
    end
    puts 'have created fake restaurants'
    puts "now you have #{Restaurant.count} restaurants data"
  end
end
