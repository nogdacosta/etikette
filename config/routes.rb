Rails.application.routes.draw do
  devise_for :users,  path: '',
                      path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', password: 'secret', confirmation: 'verification', unlock: 'unblock' },
                      controllers: { registrations: 'registrations' }

  # resources :bookmarks
  resources :collections

  # After authenticated, send user to this page
  authenticated :user do
    root 'collections#index', as: :authenticated_root
  end

  # unauthenticated :user do
  #   root 'devise/sessions#new', as: :unauthenticated_root
  # end

  # While I can't figure out how to force the user to be logged in
  root 'collections#index'


  # Inside Each collection we have a list of collections/bookmarks
  get 'collections/:collection_id',                 to: 'collections#index',            as: :collection_items
  get 'collections/:collection_id/new_bookmark',    to: 'collections#new_bookmark',     as: :new_bookmark
  post 'collections/:collection_id/save_bookmark',  to: 'collections#save_bookmark',    as: :save_bookmark


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
