Clovrr::Application.routes.draw do
  
  resources :posts, :users
  
  root :to => 'posts#index'
end
