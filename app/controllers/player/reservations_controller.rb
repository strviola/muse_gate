class Player::ReservationsController < Player::BaseController
  before_action :find_reservation, only: [:edit, :update]
  before_action :find_room_plan, only: [:new, :create]

  def index
  end

  def new
    @reservation = Reservation.new(room: @room, plan: @plan, status: :initial)
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

  def find_room_plan
    @room = Room.find(params[:room_id])
    @plan = Plan.find(params[:plan_id])
  end
end
