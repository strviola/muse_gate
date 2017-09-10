DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
require_relative 'common'

include FactoryGirl::Syntax::Methods

# Account
account = create(:account, :player, name: 'test_player')
address = create(:address)
create(:player, name: 'テスト演奏者', account: account, address: address)
