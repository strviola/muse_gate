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

class Address < ApplicationRecord
  belongs_to :prefecture

  %i(postcode prefecture city detail).each do |key|
    validates key, presence: true
  end

  def full_name
    "#{prefecture.name} #{city} #{detail}"
  end
end
