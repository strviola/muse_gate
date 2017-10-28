class Player::ReservationsController < Player::BaseController
  before_action :find_reservation, only: [:edit, :update]
  before_action :find_room_plan, only: [:new]

  def index
  end

  def new
    @reservation = Reservation.new(
      room: @room, plan: @plan, status: :initial, player: current_player)
    session[:reservation] = @reservation
  end

  def temp
    @reservation = Reservation.new(session[:reservation].merge(reservation_params))
    @reservation.end_time = @reservation.start_time + @reservation.plan.available_time.hours
    if @reservation.valid?
      session[:reservation] = @reservation
      redirect_to action: :confirm
    else
      render :new
    end
  end

  def confirm
    @reservation = Reservation.new(session[:reservation])
  end

  def create
    binding.pry
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

  def reservation_params
    params.require(:reservation).permit(:start_time)
  end
end
