Rails.application.routes.draw do
  resources :items do
    resources :bookings, only: [:create, :show, :update, :edit]
  end
  resources :bookings, only: [:index, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/about', to: 'pages#about', as: 'about'

  
  

end
