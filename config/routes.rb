Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show, :edit]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # 画像投稿post_imagesには、「新規投稿」「一覧」「詳細機能」「削除」のみ
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as:'about'
end
