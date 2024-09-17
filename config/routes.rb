Rails.application.routes.draw do
  root "registrations#index"

  resources :registrations do
    collection do
      get 'register_modal'
    end
  end
end