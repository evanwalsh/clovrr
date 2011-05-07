Clovrr::Application.routes.draw do
  
  resources :posts
  
  get '/posts/:url', to: 'posts#show'
  
  root :to => 'posts#index'
end
