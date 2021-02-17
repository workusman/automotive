Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: proc { [200, {}, ['alive']] }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :reservations, only: %i[create destroy show]
      resources :vehicles, only: %i[index create]
      resources :customers, only: %i[index create]
    end
  end
end
