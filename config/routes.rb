Rails.application.routes.draw do

  devise_for :users
  resources :products
  
  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  post 'static_pages/thank_you'

  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
