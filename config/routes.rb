Rails.application.routes.draw do

  namespace :admin do
    resources :cuisines
  end
  namespace :admin do
    resources :users
  end
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

  get '/recipes/user/:user', to: 'recipes#index', as: 'recipe_user'
  resources :recipes, only: [:index, :show]

  # ADMIN

  get '/admin', to: 'admin#index', as: 'admin'
  namespace :admin do
    resources :recipes, :concerns => :paginatable
  end

  # AUTHENTICATION

  devise_for :users

end
