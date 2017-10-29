# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  host_id     :integer          not null
#  name        :string           not null
#  description :text
#  address_id  :integer          not null
#  has_piano   :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_rooms_on_address_id  (address_id)
#  index_rooms_on_host_id     (host_id)
#

class Room < ApplicationRecord
  belongs_to :host
  belongs_to :address
  has_many :plans
  has_many :reservations

  %i(host name address).each do |key|
    validates key, presence: true
  end

  accepts_nested_attributes_for :address
end
