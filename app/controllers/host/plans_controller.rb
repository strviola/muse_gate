class Host::PlansController < Host::BaseController
  before_action :find_room, only: [:new, :create]
  before_action :find_plan, only: [:edit, :update]

  def new
    @plan = Plan.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_room
    @room = Room.find_by(id: params[:room_id])
  end

  def find_plan
    @plan = Plan.find_by(id: params[:id])
  end
end
