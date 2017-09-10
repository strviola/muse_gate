class Player::BaseController < ApplicationController
  before_action :authorize

  def login_redirect_path
    player_root_path
  end
end
