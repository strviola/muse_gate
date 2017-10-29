class Host::ReservationsController < Host::BaseController
  before_action :find_reservation, only: [:edit, :update]

  def index
    @reservations = current_host.reservations
  end

  def edit
    # 確認した時点でステータスを更新
    @reservation.update(status: :pending) if @reservation.initial?
  end

  def update
    @reservation.update(status: reservation_params[:status])
    if @reservation.fixed?
      flash[:notice] = '予約が確定しました'
    elsif @reservation.pending?
      flash[:notice] = '確定を取り消しました'
    end
    redirect_to action: :edit
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end
