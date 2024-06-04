Rails.application.routes.draw do
  # devise_for :adminsこれを削除
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
 
  scope module: :public do
    
   devise_for :users
   root to: "homes#top"
   get 'homes/about' => 'homes#about', as:'about'
  
  
   resources :post_images, only: [:new, :create, :index, :show, :destroy]do
  # 画像投稿post_imagesには、「新規投稿」「一覧」「詳細機能」「削除」のみ
     resource :favorite, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
     # コメントは、投稿画像に対してコメントされるからpost_commentsは、post_imagesに結びつく（親子関係になる）
   end
   resources :users, only: [:show, :edit, :update]
  end
  
end
