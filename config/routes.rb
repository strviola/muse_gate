Rails.application.routes.draw do
  root to: 'top#show'

  # 演奏者側
  namespace :player do
    root to: 'sessions#new'

    # ログイン・ログアウト
    resource :sessions, only: [:new, :create, :destroy]
    get 'menu', to: 'menu#show'

    # 練習室一覧
    resources :rooms, only: [:index, :show] do
      # 予約新規
      resources :reservations, only: [:new, :create]
    end

    # 予約確認・編集
    resources :reservations, only: [:index, :edit, :update]
  end

  namespace :host do
    root to: 'sessions#new'

    # ログイン・ログアウト
    resource :sessions, only: [:new, :create, :destroy]
    get 'menu', to: 'menu#show'

    # 練習会場管理
    resources :rooms, only: [:index, :new, :create, :edit, :update], shallow: true do
      # 会場使用プラン
      resources :plans, only: [:new, :create, :edit, :update]
    end

    # 予約管理
    resources :reservations, only: [:index, :edit, :update]
  end
end
