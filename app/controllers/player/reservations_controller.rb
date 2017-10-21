class Player::ReservationsController < Player::BaseController
  before_action :find_reservation, only: [:edit, :update]
  before_action :find_room, only: [:new, :create]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_room
    @room = Room.find(params[:room_id])
  end
end
