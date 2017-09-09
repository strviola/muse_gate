# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  account_id :integer
#  address_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_players_on_account_id  (account_id)
#  index_players_on_address_id  (address_id)
#

FactoryGirl.define do
  factory :player do
    account nil
    address nil
    name "MyString"
  end
end
