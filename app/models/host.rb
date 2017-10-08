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

class Host < ApplicationRecord
  belongs_to :account
  belongs_to :address
  has_many :rooms

  %i(account name address).each do |key|
    validates key, presence: true
  end
end
