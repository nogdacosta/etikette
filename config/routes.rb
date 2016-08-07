Rails.application.routes.draw do
  devise_for :users,  path: '',
                      path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', password: 'secret', confirmation: 'verification', unlock: 'unblock' },
                      controllers: { registrations: 'registrations' }

  # resources :bookmarks
  # resources :collections

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
  get 'collections',                                to: 'collections#index',          as: :collections
  get 'collections/:collection_id',                 to: 'collections#show',           as: :collection
  get 'collections/:collection_id/new_bookmark',    to: 'collections#new_bookmark',   as: :new_bookmark
  post 'collections/:collection_id/save_bookmark',  to: 'collections#save_bookmark',  as: :save_bookmark

  get 'collections/:collection_id/new',             to: 'collections#new',            as: :new_collection
  get 'collections/:collection_id/edit',            to: 'collections#edit',           as: :edit_collection
  post 'collections/:collection_id/save',           to: 'collections#save',           as: :save_collection
  patch 'collections/:collection_id/update',        to: 'collections#update',         as: :update_collection


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
