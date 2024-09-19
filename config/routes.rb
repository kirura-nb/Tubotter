Rails.application.routes.draw do
  # root :to => "home#index"
   root :to => "users#new"

  # 新規登録画面のルート
  resource :users, only: [:new, :show, :edit, :create, :update]

  # ログイン時のパスを取得
  get 'login', to: 'sessions#new', as: 'new_sessions' # ログイン前の処理
  post 'login', to: 'sessions#create', as: 'create_sessions' # ログイン後の処理
  delete 'logout', to: 'sessions#destroy', as: 'destroy_sessions' # ログアウト処置

  # ログイン後のパスを取得
  get "home/index"
  get "home/explore"
  get "home/messages"
  get "home/notifications"
  get "home/post"
  get "home/profile"
end
