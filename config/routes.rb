Rails.application.routes.draw do


  authenticate :user, lambda { |u| u.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

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
    resources :documents, only: [ :index, :new, :create ]
  end

  resources :documents, except: [ :index, :new ]

  resources :document_blocks
  resources :users, only: [ :show, :edit, :update ] do
    resources :phones, except: [ :index, :show ]
  end
end
