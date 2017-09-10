class Player::SessionsController < ApplicationController
  def new
  end

  # log in
  def create
    account = Account.find_by(name: params[:name])
    if account&.player? && account&.authenticate(params[:password])
      session[:account] = account
      session[:role] = 'player'
      redirect_to '' # TODO: トップ画面
    else
      render :new
    end
  end

  # log out
  def destroy
  end
end
