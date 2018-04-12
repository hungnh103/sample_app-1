Rails.application.routes.draw do
  root "static_pages#home"

  get "static_pages/home"

  get "static_pages/help"

  get "static_pages/about"

  get "static_pages/contact"

  scope "(:locale)" do
  	resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
        get :who_bought, :on => :member
    end
    root :to => "store#index", :as => "store"
    end
end
