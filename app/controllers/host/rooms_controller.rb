class Host::RoomsController < Host::BaseController
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
end
