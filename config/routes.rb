Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/destroy'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :public do
    get 'customers/index'
    get 'customers/new'
    get 'customers/create'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/destroy'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/new'
    get 'comments/create'
    get 'comments/show'
    get 'comments/edit'
    get 'comments/update'
    get 'comments/destroy'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/create'
    get 'reviews/show'
    get 'reviews/edit'
    get 'reviews/update'
    get 'reviews/destroy'
  end
  namespace :public do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'items/destroy'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
