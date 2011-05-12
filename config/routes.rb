Clovrr::Application.routes.draw do
  
  resources :posts, :users
  resource :session, only: [ :index, :new, :create, :destroy ]
  
  root :to => 'posts#index'
end
