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

  
end
