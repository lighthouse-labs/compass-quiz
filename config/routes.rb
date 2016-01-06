Rails.application.routes.draw do

  root 'welcome#index'

  resources :activities, only: [:index, :create, :destroy]

  resources :cohorts, only: [:index, :create, :destroy]

  resources :questions

end
