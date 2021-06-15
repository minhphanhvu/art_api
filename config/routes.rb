Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Users and Artworks
  resources :users do
    resources :artworks
  end

  # Comments
  resources :users do
    member do
      get 'comments', to: 'comments#index'
      get 'liked-comments', to: 'comments#like'
      get 'liked-artworks', to: 'artworks#like'
      get 'favorite-artworks', to: 'artworks#favorites'
    end
  end
  resources :comments, only: [:create, :destroy]
  get 'liked-comments/:id/users', to: 'comments#liking_users'

  # Artworks
  resources :artworks do
    member do
      get 'comments', to: 'comments#index'
    end
  end
  get 'liked-artworks/:id/users', to: 'artworks#liking_users'

  # ArtworkShares
  resources :artwork_shares, only: [:create, :destroy]
end
