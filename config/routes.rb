Rails.application.routes.draw do

  namespace :admin do
    resources :meal_types
  end
  # CONCERNS

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, as: ''
  end

  # ROOT

  root 'recipes#index'

  # RESOURCES

  # get '/recipes/:meal_type', to: 'recipes#meal_type', as: 'meal_types'
  resources :recipes, only: [:index, :show]

  # ADMIN

  get '/admin', to: 'admin#index'
  namespace :admin do
    resources :recipes, :concerns => :paginatable
  end

  # AUTHENTICATION

  devise_for :users

end
