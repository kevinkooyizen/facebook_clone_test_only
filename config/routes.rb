Rails.application.routes.draw do
  delete '/sessions' => 'sessions#destroy', as: "signout"
  resources :sessions
  resources :statuses 
  resources :likes
  resources :users
  root 'welcome#index'
end
