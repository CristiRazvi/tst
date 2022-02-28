Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "companies#index"

  resources :companies, only: [:index] do
    collection do
      get :saved
      post :add_to_favorites
    end
  end
end
