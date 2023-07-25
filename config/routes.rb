Rails.application.routes.draw do

  # 顧客用
# URL /users/sign_in ...
devise_for :user, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    
  end

  scope module: :public do
    root to: "homes#top"
   resources :lists, only: [:index, :new, :create, :show, :edit, :update, :destroy]do
   resources :post_comments, only: [:create, :destroy]
   resources :favorites, only: [:create, :destroy]
   end
   resources :users, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 
