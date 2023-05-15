Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :public do
get "customers/information/edit" => "/customers#edit", as: "customers_edit"
get 'customers/mypage' => '/customers#show', as: "customers_mypage"

resources :cart_items, only: [:index, :update, :destroy, :create]
end


namespace :admin do
get "admin/top" => "admin/homes#top", as: "admin_top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

end