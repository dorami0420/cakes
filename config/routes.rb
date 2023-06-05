Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions",
  }


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  namespace :public do
    get "homes/top"
    get "homes/about"
    get 'cart_items/index'
    get "customers/information/edit" => "customers#edit", as: "customers_edit"
    get "customers/mypage" => "customers#show", as: "customers_mypage"
    get "customers/update" => "customers#update"
    get "customers/confirm" => "customers#confirm", as: "customer_confirm"
    patch "customers/update" => "customers#cancel", as: "customer_cancel"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"

     resources :cart_items, only: [:index, :update, :destroy, :create] do
     member do
       patch 'increase'
       patch 'decrease'
     end
   end

    get "orders/thanks" => "orders#thanks"
    resources :orders, only: [:index, :show, :new, :create]
    post "orders/confirm" => "orders#confirm"


   resources :items, only: [:index, :show]

  end


  namespace :admin do
    get 'post_images/index'

    get "top" => "homes#top", as: "top"
    get "show" => "homes#show", as: "show"

    resources :items, expect: [:destroy]

    resources :customers, expect: [:new, :destroy, :create]
  end
  #get "orders/:id/show" => "/orders/:id#show", as: "orders_show"


    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end