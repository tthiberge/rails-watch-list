Rails.application.routes.draw do
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: [:new, :create]
  end
    resources :bookmarks, only: [:destroy]
end
