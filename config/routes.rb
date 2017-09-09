Rails.application.routes.draw do
  root to: 'top#show'

  # 演奏者側
  namespace :player do
    root to: 'sessions#new'

    # ログイン・ログアウト
    resource :sessions, only: [:new, :create, :destroy]
  end
end
