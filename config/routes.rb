Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                omniauth_callbacks: "users/omniauth_callbacks",
                sessions: "users/sessions",
                registrations: "users/registrations",
                confirmations: "users/confirmations"
              }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects do
    resources :members
  end

  resources :users, only: [ :show, :edit, :update ] do
    resources :phones, except: [ :index, :show ]
  end

  resources :documents do
    resources :document_blocks
  end
end
