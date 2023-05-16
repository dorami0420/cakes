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
    get "customers/confirm" => "customers#confirm"
    get "customers/update" => "customers#cancel"

    resources :cart_items, only: [:index, :update, :destroy, :create]
    get "cart_items/destroy_all" => "/cart_items#destroy_all"


    resources :orders, only: [:index, :show, :new, :create]
    get "orders/confirm" => "/orders#confirm"
    get "/orders/thanks" => "/orders#thanks"

  end


  namespace :admin do
    get "top" => "/homes#top", as: "admin_top"

    resources :items, expect: [:destroy]

    resources :customers, expect: [:new, :destroy, :create]

  #get "orders/:id/show" => "/orders/:id#show", as: "orders_show"



    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

end