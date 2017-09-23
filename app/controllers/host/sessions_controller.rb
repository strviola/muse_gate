class Host::SessionsController < ApplicationController
  include LoginSession

  def new
  end

  # log in
  def create
    account = Account.find_by(name: session_params[:name])
    if account&.host? && account&.authenticate(session_params[:password])
      save_session(account, 'host')
      redirect_to host_menu_path
    else
      render :new
    end
  end

  # log out
  def destroy
    log_out
  end
end
