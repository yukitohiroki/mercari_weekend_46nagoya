Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'items#index'

  resources :items do
    member do
      post 'pay'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :payment_informations, only: [:index, :new, :create, :destroy]
  end

  # resources :users, only: %i(index show) do
  #   collection do
  #     get :logout
  #   end
  # end


  resources :orders, only: [:show, :create]

  match 'secondcategory', to: 'items#secondcategory', via: [:get, :post]
  match 'thirdcategory', to: 'items#thirdcategory', via: [:get, :post]
  match 'search_secondcategory', to: 'items#search_secondcategory', via: [:get, :post]
  match 'search_thirdcategory', to: 'items#search_thirdcategory', via: [:get, :post]
  resources :categorys
  resources :second_categorys, only: [:show]
  resources :third_categorys, only: [:show]
  get "logout", to: 'users#logout'
  get "users-form", to: 'users#index'
  get "search", to: 'items#search', as: 'search'
  get "order_confirm/:id", to: 'items#order_confirm', as: 'order_confirm'
  get "users/user_info/:id", to: 'users#user_info', as: 'users_user_info'
  get "users/user_exhibitation_products/:id", to: 'users#user_exhibitation_products', as: 'user_exhibitation_products'
  get "users/user_item_show/:id", to: 'users#user_item_show', as: 'user_item_show'
end
