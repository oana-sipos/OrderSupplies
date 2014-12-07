OrderSupplies::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :suppliers

  resources :order_lines do
    member do
      put 'more'
      put 'less'
    end
  end

  # resources :orders do
  #   member do
  #     post 'duplicate'
  #   end
  #   collection do 
  #     get '/review/:uuid/' => 'orders#review'
  #   end
  # end

  resources :orders do
    get '/review/:uuid', action: 'review', on: :collection, as: 'review'
    post 'duplicate', on: :member
    post 'send_review', on: :member
    post 'send_final', on: :member
  end

  resources :articles

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_for :users
  root to: 'welcome#index'
end
