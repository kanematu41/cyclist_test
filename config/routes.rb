Rails.application.routes.draw do

  root 'home#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
  	resource :comments, only: [:create, :destroy]
  	resource :likes, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/:id/follows' => 'relationships#follows', as: 'follows'
  get 'user/:id/followers' => 'relationships#followers', as: 'followers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
