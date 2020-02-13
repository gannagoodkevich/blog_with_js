Rails.application.routes.draw do
  resources :posts
  resources :comments
  get '/', to: 'application#main'
  root 'application#main'
end