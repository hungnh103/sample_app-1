Rails.application.routes.draw do
  get "users/new"

  root "static_pages#home"

  get  "static_pages/home"

  get  "/help",    to: "static_pages#help"

  get  "/about",   to: "static_pages#about"

  get  "/contact", to: "static_pages#contact"

  get  "/signup",  to: "users#new"

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
