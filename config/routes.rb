Rails.application.routes.draw do
  resources :items do
    resources :bookings, only: [:create, :show]
    member do
      get :switch_availability
    end
  end
  resources :bookings, only: [:index, :destroy, :update, :edit]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/about', to: 'pages#about', as: 'about'
  get '/dashboard', to: 'pages#dashboard', as:'dashboard'
  get '/success', to: 'payments#success', as: 'payments_success'
  post '/payments/webhook', to: 'payments#webhook', as: 'payments_webhook'
  post '/payments', to: 'payments#create_payment_intent', as: 'create_payment_intent'
  

end
