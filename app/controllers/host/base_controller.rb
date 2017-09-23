class Host::BaseController < ApplicationController
  include LoginSession

  before_action :authorize
  before_action :current_host

  def login_redirect_path
    host_root_path
  end

  def current_host
    @host = Host.find_by(account: current_account)
  end
end
