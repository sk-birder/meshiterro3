Rails.application.routes.draw do
  # devise_for :admins
  # admin/sign_in用の設定
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get 'homes/about', as: 'about'
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

  # get 'homes/top'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
