class Host::ReservationsController < Host::BaseController
  before_action :find_reservation, only: [:edit, :update]

  def index
    @reservations = current_host.reservations
  end

  def edit
  end

  def update
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
