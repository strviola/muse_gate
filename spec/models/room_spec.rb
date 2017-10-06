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

require 'rails_helper'

RSpec.describe Room, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
