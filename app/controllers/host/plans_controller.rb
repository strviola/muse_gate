class Host::PlansController < Host::BaseController
  before_action :find_room, only: [:new, :create]
  before_action :find_plan, only: [:edit, :update]

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.room = @room
    if @plan.save
      flash[:success] = 'プランの作成に成功しました！'
      redirect_to edit_host_plan_path(@plan)
    else
      flash.now[:errors] = @plan.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @plan.attributes = plan_params
    if @plan.save
      flash[:success] = 'プランを更新しました！'
      redirect_to edit_host_plan_path(@plan)
    else
      flash.now[:errors] = @plan.errors.full_messages
      render :edit
    end
  end

  private

  def find_room
    @room = Room.find_by(id: params[:room_id])
  end

  def find_plan
    @plan = Plan.find_by(id: params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :available_time, :price, :description)
  end
end
