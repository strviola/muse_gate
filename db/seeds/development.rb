DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
require_relative 'common'

include FactoryGirl::Syntax::Methods

# Player
player_account = create(:account, :player, name: 'test_player')
main_player = create(:player, name: 'テスト演奏者', account: player_account)

# Host
host_account = create(:account, :host, name: 'test_host')
main_host = create(:host, name: 'テストホスト', account: host_account)

# Room
10.times do |i|
  if i % 3 == 0
    create(:room, host: main_host, has_piano: true)
  else
    create(:room, host: main_host, has_piano: false)
  end
end

# Plan
room_with_plan = create(:room, host: main_host, name: '練習室 (プラン作成済)')
plans = create_list(:plan, 5, room: room_with_plan)

# Reservation
create(:reservation, room: room_with_plan, plan: plans[0], player: main_player)
