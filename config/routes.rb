Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :post_imeges, only: [:new, :create, :index, :show]

  get 'homes/about' => 'homes#about', as:"about"
end