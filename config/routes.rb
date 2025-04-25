Rails.application.routes.draw do
  # devise_for :admins
  # admin/sign_in用の設定
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users
  root to: "homes#top"

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get 'homes/about', as: 'about'
  # get 'homes/top'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
