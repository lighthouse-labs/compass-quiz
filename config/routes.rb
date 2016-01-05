Rails.application.routes.draw do

  root 'welcome#index'

  resources :cohorts, only: [:index, :create, :destroy]

end
