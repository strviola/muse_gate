Rails.application.routes.draw do
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
    get 'menu', to: 'menu#show'

    # 練習会場管理
    resources :rooms, only: [:index, :new, :create, :edit, :update] do
      # 会場使用プラン
      resources :plans, only: [:new, :create, :edit, :update]
    end
  end
end
