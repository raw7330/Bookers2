Rails.application.routes.draw do
  get 'search/search'
  devise_for :users

  resources :books
  resources :users
  root to: 'homes#top'
  get 'home/about' =>'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy] do
   resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]

  end

  post 'follow/:id' => 'relationships#follow',as:'follow'
  post 'unfollow/:id' => 'relationships#unfollow',as:'anfollow'
  
  get'/search' => 'search#search'

  resources :users do
    get :followings, on: :member
    get :followers, on: :member
  end

end
