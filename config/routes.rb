Rails.application.routes.draw do
  devise_for :users, path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', password: 'secret', confirmation: 'verification', unlock: 'unblock' }

  resources :bookmarks

  # After authenticated, send user to this page
  authenticated :user do
    root 'bookmarks#index', as: :authenticated_root
  end

  # unauthenticated :user do
  #   root 'devise/sessions#new', as: :unauthenticated_root
  # end

  # While I can't figure out how to force the user to be logged in
  root 'bookmarks#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
