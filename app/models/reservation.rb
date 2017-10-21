# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  plan_id    :integer          not null
#  room_id    :integer          not null
#  player_id  :integer          not null
#  start_time :datetime         not null
#  end_time   :datetime         not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reservations_on_plan_id    (plan_id)
#  index_reservations_on_player_id  (player_id)
#  index_reservations_on_room_id    (room_id)
#

class Reservation < ApplicationRecord
  belongs_to :plan
  belongs_to :room
  belongs_to :player
end
