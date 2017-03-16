Rails.application.routes.draw do
  get 'category/:id' => 'categories#show'
  resources :jobs, only: [:index, :show, :create] do
    post :activate, on: :member
  end
end
