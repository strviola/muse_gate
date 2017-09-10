# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  role            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :account do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password 'test1234'
    password_confirmation 'test1234'
    role :player

    trait :player

    trait :host do
      role :host
    end
  end
end
