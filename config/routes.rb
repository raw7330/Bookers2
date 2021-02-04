Rails.application.routes.draw do
  devise_for :users

  resources :books
  resources :users
  root to: 'homes#top'
  get 'home/about' =>'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy] do
   resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end

end
