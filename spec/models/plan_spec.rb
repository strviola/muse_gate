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

require 'rails_helper'

RSpec.describe Plan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
