Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions",
  }


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  namespace :public do
    get "customers/information/edit" => "customers#edit", as: "customers_edit"
    get "customers/mypage" => "customers#show", as: "customers_mypage"
    get "customers/update" => "customers#update"
    get "customers/confirm" => "customers#confirm", as: "customer_confirm"
    patch "customers/update" => "customers#cancel", as: "customer_cancel"

    resources :cart_items, only: [:index, :update, :destroy, :create]
    get "cart_items/destroy_all" => "/cart_items#destroy_all"


    resources :orders, only: [:index, :show, :new, :create]
    get "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"

   resources :items, only: [:index, :show]

  end


  namespace :admin do
    get 'post_images/index'

    get "top" => "homes#top", as: "top"

    resources :items, expect: [:destroy]

    resources :customers, expect: [:new, :destroy, :create]
  end
  #get "orders/:id/show" => "/orders/:id#show", as: "orders_show"


    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end