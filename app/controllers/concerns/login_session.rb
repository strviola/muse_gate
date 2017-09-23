module LoginSession
  extend ActiveSupport::Concern

  included do
    def authorize
      unless current_account
        # login_redirect_path must be defined in #{namespace}::BaseController
        redirect_to login_redirect_path
      end
    end

    def current_account
      account_id = session[:account_id]
      role = session[:role]
      @account ||= Account.find_by(id: account_id)
      return if @account.nil? || role.nil? || @account.role != role
      @account
    end

    def log_out
      session.delete(:account)
      session.delete(:role)
    end

    def save_session(account, role)
      session[:account_id] = account.id
      session[:role] = role
    end

    def session_params
      params.require(:session).permit(:name, :password)
    end
  end
end
