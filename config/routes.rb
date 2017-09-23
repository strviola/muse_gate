Rails.application.routes.draw do
  namespace :host do
    get 'sessions/new'
  end

  namespace :host do
    get 'sessions/create'
  end

  namespace :host do
    get 'sessions/destroy'
  end

  root to: 'top#show'

  # 演奏者側
  namespace :player do
    root to: 'sessions#new'

    # ログイン・ログアウト
    resource :sessions, only: [:new, :create, :destroy]
    # 予約
    resources :reservations
  end

  namespace :host do
    root to: 'sessions#new'

    # ログイン・ログアウト
    resource :sessions, only: [:new, :create, :destroy]
  end
end
