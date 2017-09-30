class Host::RoomsController < Host::BaseController
  before_action :find_room, only: [:edit, :update
  ]
  def index
    @rooms = current_host.rooms
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

  def find_room
    @room = Room.find_by(id: params[:id].to_i)
  end
end
