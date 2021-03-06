Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'orders#index'

  resources :orders

  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index show]
    end
  end
end
