class Host::RoomsController < Host::BaseController
  before_action :find_room, only: [:edit, :update]

  def index
    @rooms = current_host.rooms
  end

  def new
    @room ||= Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.host = @host
    if @room.save
      flash[:success] = "練習室「#{@room.name}」が登録されました！"
      redirect_to edit_host_room_path @room
    else
      flash.now[:errors] = '入力項目にエラーがあります' # TODO: あとでちゃんと表示
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def find_room
    @room = Room.find_by(id: params[:id].to_i)
  end

  def room_params
    params.require(:room).permit(
      :name, :description,
      address_attributes: [
        :id, :postcode, :prefecture_id, :city, :detail
      ])
  end
end
