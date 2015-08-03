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

  resources :publishers do 
    resources :contents
  end

  namespace :api do
    resources :inventory_imports, only: [] do 
      collection do
        put "import_all"
        put "import_delta"
        put "import_image_all"
      end
    end
  end

end
