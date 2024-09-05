Rails.application.routes.draw do
  resources :registrations
  root "registrations#index"
end
