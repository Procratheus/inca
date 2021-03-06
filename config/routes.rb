Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations", confirmations: "confirmations" }
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :publishers

  resources :contents do
    collection do
      get :datatable_ajax_content
    end
  end

  namespace :api do
    resources :inventory_imports do
      collection do
        put :import_all
        put :import_delta
      end
    end
  end

end
