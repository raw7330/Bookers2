Rails.application.routes.draw do
  devise_for :users
  
  resources :books
  resources :users
  root to: 'homes#top'
  get 'home/about' =>'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy] do
   resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  
  post 'follow/:id' => 'relationships#follow',as:'follow'
  post 'unfollow/:id' => 'relationships#unfollow',as:'anfollow'

   
  end

end
