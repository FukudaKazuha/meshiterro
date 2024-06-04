Rails.application.routes.draw do
  # devise_for :adminsこれを削除
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show, :edit, :update]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
  # 画像投稿post_imagesには、「新規投稿」「一覧」「詳細機能」「削除」のみ
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    # コメントは、投稿画像に対してコメントされるからpost_commentsは、post_imagesに結びつく（親子関係になる）
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as:'about'
end
