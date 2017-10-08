class Host::RoomsController < Host::BaseController
  before_action :find_room, only: [:edit, :update]

  def index
    @rooms = current_host.rooms.includes(address: :prefecture)
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
      flash.now[:errors] = @room.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @room.attributes = room_params
    if @room.save
      flash[:success] = "練習室「#{@room.name}」が更新されました！"
      redirect_to edit_host_room_path @room
    else
      flash.now[:errors] = @room.errors.full_messages
      render :edit
    end
  end

  private

  def find_room
    @room = Room.find_by(id: params[:id].to_i)
  end

  def room_params
    params.require(:room).permit(
      :name, :description, :has_piano,
      address_attributes: [
        :id, :postcode, :prefecture_id, :city, :detail
      ])
  end
end
