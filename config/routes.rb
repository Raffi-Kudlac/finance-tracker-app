Rails.application.routes.draw do
  devise_for :users
  get 'welcomes/index'
  get 'my_portfolio', to: "users#my_portfolio"
  root 'welcomes#index'

  get 'search_stocks', to: "stocks#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
