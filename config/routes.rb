Rails.application.routes.draw do

  root 'pages#home'

  resources :activities, only: [:index, :show, :create, :destroy, :update]

  resources :cohorts, only: [:index, :create, :destroy, :show, :update]

  resource :profile, only: [:show, :update]

  resources :questions

  resources :quizzes, only: [:index, :show, :create, :destroy] do
    resources :submissions, only: [:new]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :submissions, only: [:create, :show, :destroy]

  resources :users, only: [:index, :create, :destroy]

end
