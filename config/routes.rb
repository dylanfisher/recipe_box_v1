Rails.application.routes.draw do

  # CONCERNS

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  # ROOT

  root 'recipes#index'

  # RESOURCES

  resources :recipes, only: [:index, :show]

  # ADMIN

  get '/admin', to: 'admin#index'
  namespace :admin do
    resources :recipes, :concerns => :paginatable
  end

  # AUTHENTICATION

  devise_for :users

end
