Rails.application.routes.draw do
  get "cars/index"
  get "cars/show"
  get "cars/new"
  get "cars/edit"
  get "years/index"
  get "years/show"
  get "years/new"
  get "years/edit"
  get "car_models/index"
  get "car_models/show"
  get "car_models/new"
  get "car_models/edit"
  get "makes/index"
  get "makes/show"
  get "makes/new"
  get "makes/edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "makes#index"
  resources :cars
  resources :makes
  resources :years do
    collection { get 'for_model/:make_id/:car_model_id', action: :for_model, as: :for_model }
  end
  resources :car_models do
    collection do
      get 'for_make/:make_id', action: :for_make, as: :for_make
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
