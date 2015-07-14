Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  get 'users/destroy'

  devise_for :users 
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show, :destroy]

end
