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
    @reservation.update(status: :fixed)
    flash[:notice] = '予約が確定しました'
    redirect_to action: :edit
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
