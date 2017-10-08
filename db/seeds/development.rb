DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
require_relative 'common'

include FactoryGirl::Syntax::Methods

# Player
player_account = create(:account, :player, name: 'test_player')
create(:player, name: 'テスト演奏者', account: player_account)

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
