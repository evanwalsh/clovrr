Clovrr::Application.routes.draw do

  themes_for_rails

  mount API => "/"
  
  resource :user
  resources :posts, only: [ :index, :show ]
  resource :session, only: [ :index, :new, :create, :destroy ]
  
  get '/admin', to: 'admin#index'
  namespace :admin do
    resources :posts, :users, :preferences, except: [ :show ]
    post '/admin/posts/preview'
  end
  
  get '/account', to: 'users#show'
  get '/account/edit', to: 'users#edit', as: 'edit_account'
  
  get '/feed', to: 'posts#index', format: 'atom'
  
  get '/archive', to: 'posts#archive', as: 'archive'
  get '/archive/:year', to: 'posts#archive', as: 'year_archive'
  get '/archive/:year/:month', to: 'posts#archive', as: 'month_archive'
  
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  
  root :to => 'posts#index'
end
