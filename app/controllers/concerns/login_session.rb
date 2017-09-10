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
      account = session[:account]
      role = session[:role]
      return if account.nil? || role.nil? || account.role != role
      account
    end

    def log_out
      session.delete(:account)
      session.delete(:role)
    end
  end
end
