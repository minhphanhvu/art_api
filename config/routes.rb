Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Users and Artworks
  resources :users do
    resources :artworks
  end

  # ArtworkShares
  resources :artwork_shares, only: [:create, :destroy]

  # Comments
  resources :users do
    member do
      get 'comments', to: 'comments#index'
    end
  end

  resources :artworks do
    member do
      get 'comments', to: 'comments#index'
    end
  end

  resources :comments, only: [:create, :destroy]
end
