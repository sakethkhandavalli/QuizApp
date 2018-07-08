Rails.application.routes.draw do
  resources :states
  resources :questions
  resources :subgenres
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup'  => 'users#new'
  resources :users

  post 'signup' => 'users#create'

  get '/login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get '/genres' => 'genres#new'

  get '/subgenres' => 'sub_genres#new'

  post '/subgenres' => 'sub_genres#new'

  get '/questions' => 'questions#new'

  post 'questions' => 'questions#new'

  get '/eval/:crt1/:crt2/:crt3/:crt4' => 'questions#answers' , as: :test

  get 'subglboard' => 'questions#subglboard'

  get 'glboard' => 'questions#glboard'

  root 'users#new'

end
