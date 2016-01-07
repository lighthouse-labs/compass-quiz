Rails.application.routes.draw do

  root 'welcome#index'

  resources :activities, only: [:index, :create, :destroy]

  resources :cohorts, only: [:index, :create, :destroy]

  resource :profile, only: [:show, :update]

  resources :questions

  resource :session, only: [:new, :create, :destroy]

end
