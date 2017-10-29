class Player::ReservationsController < Player::BaseController
  before_action :find_reservation, only: [:edit, :update]
  before_action :find_room_plan, only: [:new]
  before_action :new_reservation_from_session, only: [:temp, :confirm, :create]

  def index
    @reservations = current_player.reservations
  end

  def new
    @reservation = Reservation.new(
      room: @room, plan: @plan, status: :initial, player: current_player)
    session[:reservation] = @reservation
  end

  def temp
    @reservation.assign_attributes(reservation_params)
    @reservation.end_time = @reservation.start_time + @reservation.plan.available_time.hours
    if @reservation.valid?
      session[:reservation] = @reservation
      redirect_to action: :confirm
    else
      render :new
    end
  end

  def confirm
  end

  def create
    @reservation.save
    session.delete(:reservation)
    flash[:notice] = true
    redirect_to controller: 'rooms', action: 'show', id: params[:room_id]
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

  def new_reservation_from_session
    @reservation = Reservation.new(session[:reservation])
  end
end
