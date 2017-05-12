Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :movie
      get 'movies/:id', to: 'movies#show'
      get 'movies', to: 'movies#index'
    end
  end
end
