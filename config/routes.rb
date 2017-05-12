Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :movie
      get 'movies/:id', to: 'movies#show'
      get 'movies', to: 'movies#index'

      resource :genre
      get 'genre/:id', to: 'genre#show'
      get 'genre', to: 'genre#index'

      resource :torrent
      get 'torrent/:id', to: 'torrent#show'
      get 'torrent', to: 'torrent#index'
    end
  end
end
