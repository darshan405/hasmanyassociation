Rails.application.routes.draw do
  get 'welcome/index'
  get 'question/new'
  root 'questions#index'
  resources :questions do
    resources :answers
  end
  devise_for :users
  resources :users
end
