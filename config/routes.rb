Rails.application.routes.draw do
  root "registrations#index"
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'
  get '/user/:id/edit', to: 'registrations#edit', as: 'edit_user'
  patch '/user/:id', to: 'registrations#update', as: 'update_user'
  delete '/user/:id', to: 'registrations#destroy', as: 'delete_user'
end
