# == Schema Information
#
# Table name: plans
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  room_id        :integer
#  available_time :integer          not null
#  price          :integer          not null
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_plans_on_room_id  (room_id)
#

FactoryGirl.define do
  factory :plan do
    name { Faker::Lorem.sentence(3) }
    association :room
    available_time 4
    price 2000
    description nil
  end
end
