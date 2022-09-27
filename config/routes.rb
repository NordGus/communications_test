Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :communications, only: [], defaults: { format: :json } do
        get :adults, on: :collection
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
