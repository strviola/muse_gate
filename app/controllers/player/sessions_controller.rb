class Player::SessionsController < ApplicationController
  include LoginSession

  def new
  end

  # log in
  def create
    account = Account.find_by(name: session_params[:name])
    if account&.player? && account&.authenticate(session_params[:password])
      session[:account_id] = account.id
      session[:role] = 'player'
      redirect_to player_reservations_path
    else
      render :new
    end
  end

  # log out
  def destroy
    log_out
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
