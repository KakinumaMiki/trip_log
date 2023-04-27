Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :prefectures, only: [:index] do
    scope module: :prefectures do
      resources :places do
        scope module: :places do
          resources :memories
        end
      end
    end
  end
  resources :plans do
    scope module: :plans do
      resources :schedules, except: [:index]
    end
  end
end
