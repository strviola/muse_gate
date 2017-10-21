# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  postcode      :string           not null
#  prefecture_id :integer          not null
#  city          :string           not null
#  detail        :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_addresses_on_prefecture_id  (prefecture_id)
#

FactoryGirl.define do
  factory :address do
    postcode { '%07d' % rand(9999999) }
    association :prefecture
    city { "#{Faker::Japanese::Name.last_name}市" }
    detail { "#{Faker::Japanese::Name.last_name}#{['町', ''].sample}#{[rand(1..10), rand(1..50), rand(1..50)].join('-')}" }
  end
end
