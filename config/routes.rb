Rails.application.routes.draw do
  devise_for :users

  resources :groups
  resources :entities

  get "splashes/index"
  unauthenticated do
    root 'splashes#index'
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
end
