# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  host_id     :integer          not null
#  name        :string           not null
#  description :text
#  address_id  :integer          not null
#  has_piano   :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_rooms_on_address_id  (address_id)
#  index_rooms_on_host_id     (host_id)
#

FactoryGirl.define do
  factory :room do
    association :host
    sequence :name, '練習室.1'
    description { Faker::Lorem.sentence(30) }
    association :address
    has_piano false
  end
end
