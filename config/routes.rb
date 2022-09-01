Rails.application.routes.draw do
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'trips#index'
  resources :trips, only: [:index] do
    resources :places
  end
end
