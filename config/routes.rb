Clovrr::Application.routes.draw do
  
  resources :posts, :users
  resource :session, only: [ :index, :new, :create, :destroy ]
  
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  
  root :to => 'posts#index'
end
