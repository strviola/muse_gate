class Player::RoomsController < ApplicationController
  def index
    # TODO: 絞り込み機能 (Hostをブックマーク、住所が近い、など)
    @rooms = Room.all.includes(:host, address: :prefecture)
  end

  def show
  end
end
