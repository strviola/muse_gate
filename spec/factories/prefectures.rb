# == Schema Information
#
# Table name: prefectures
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :prefecture do
    name "MyString"
  end
end
