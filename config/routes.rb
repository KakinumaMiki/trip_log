Rails.application.routes.draw do
  resources :plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'prefectures#index'
  resources :prefectures, only: [:index] do
    scope module: :prefectures do
      resources :places do
        scope module: :places do
          resources :memories
        end
      end
    end
  end
end
