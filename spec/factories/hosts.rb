# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  account_id :integer          not null
#  name       :string           not null
#  address_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_hosts_on_account_id  (account_id)
#  index_hosts_on_address_id  (address_id)
#

FactoryGirl.define do
  factory :host do
    association :account, strategy: :build
    association :address, strategy: :build
    name { Faker::Name.name }
  end
end
