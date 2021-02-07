Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  get 'users/:id/relationships/show_follow' => 'relationships#show_follow', as: 'follow'
  get 'users/:id/relationships/show_follower' => 'relationships#show_follower', as: 'follower'
end