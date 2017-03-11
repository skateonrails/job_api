Rails.application.routes.draw do
  resources :categories, only: :show
  resources :jobs, only: [:index, :show, :create] do
    post :activate, on: :member
  end
end
