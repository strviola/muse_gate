class Player::BaseController < ApplicationController
  include LoginSession

  before_action :authorize
  before_action :current_player

  def login_redirect_path
    player_root_path
  end

  def current_player
    @player = Player.find_by(account: current_account)
  end
end
