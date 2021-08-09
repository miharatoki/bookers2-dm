Rails.application.routes.draw do
  get 'chats/show'
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follow' => 'relationships#follow', as: 'follow'
    get 'follower' => 'relationships#follower', as: 'follower'
  end
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end
 
 get 'search' => 'searchs#search'
end