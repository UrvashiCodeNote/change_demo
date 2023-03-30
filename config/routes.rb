Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope "(:locale)", locale: /en|sw/ do
   root to: "home#index"
   devise_for :users, controllers: {
           :registrations => "users/registrations",
           :sessions => "users/sessions",
           confirmations: 'users/confirmations' }
    get "/login", :to => "devise/sessions#new"
    resources :customers
    get 'contact_books', to: 'contact_books#generate_number'
    patch 'contact_books', to: 'contact_books#update_number'
    post 'verify', to: 'customers#verify'
    get 'customers', to: 'customers#index'
  end
end
