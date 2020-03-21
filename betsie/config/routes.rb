Rails.application.routes.draw do
  resources :users do
    resources :challenges, only: [:new, :index]
  end
  resources :challenges, only: [:show, :index, :create, :update]

  get '/challenges/:id/accept' => 'challenges#accept', as: 'accept_challenge'
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
