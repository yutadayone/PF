Rails.application.routes.draw do
    # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/update'
    resources :reviews, only: [:index, :show, :destroy]
    #get 'reviews/index'
    #get 'reviews/show'
    #get 'reviews/destroy'
    resources :genres, only: [:index, :create, :edit, :update]
    #get 'genres/index'
    #get 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'

    get '/customers/mypage' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit', as: 'edit_customers'
    patch '/customers/update' => 'customers#update'
    get 'customers/withdraw_confirm' => 'customers#withdraw_confirm', as: 'withdraw_confirm'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    #get 'customers/index'
    #get 'customers/new'
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/update'
    #get 'customers/destroy'
    resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    #get 'comments/index'
    #get 'comments/new'
    #get 'comments/create'
    #get 'comments/show'
    #get 'comments/edit'
    #get 'comments/update'
    #get 'comments/destroy'
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    #get 'reviews/index'
    #get 'reviews/new'
    #get 'reviews/create'
    #get 'reviews/show'
    #get 'reviews/edit'
    #get 'reviews/update'
    #get 'reviews/destroy'
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    #get 'items/index'
    #get 'items/new'
    #get 'items/create'
    #get 'items/show'
    #get 'items/edit'
    #get 'items/update'
    #get 'items/destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :admin do
    post 'admins/sign_in', to: 'admin/sessions#sign_in'
  end
end
