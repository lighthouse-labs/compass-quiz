Rails.application.routes.draw do

  root 'pages#home'

  resources :activities, only: [:index, :show, :create, :destroy]

  resources :cohorts, only: [:index, :create, :destroy]

  resource :profile, only: [:show, :update]

  resources :questions

  resources :quizzes, only: [:index, :show, :create] do
    resources :submissions, only: [:new]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :submissions, only: [:create, :show, :destroy]

end
