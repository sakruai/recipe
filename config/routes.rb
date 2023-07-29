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
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    get "search" => "searches#search"
    get 'tagsearches/search', to: 'tagsearches#search'
   resources :lists, only: [:index, :new, :create, :show, :edit, :update, :destroy]do
   resources :post_comments, only: [:create, :destroy]
   resources :favorites, only: [:create, :destroy]
   end
   patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
   get 'users/check' => 'users#check', as: 'check'
   resources :users, only: [:show, :edit, :update]do
    member do
    get :favorites
    end
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end