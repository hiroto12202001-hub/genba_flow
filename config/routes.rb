Rails.application.routes.draw do
  devise_for :users

  root to: 'home#top'
  get 'about', to: 'home#about'
  resources :sites do
    resource :site_sections, only: [:edit, :update]
  end
  resources :site_sections, only: [:show] do
    resource :tasks, only: [:edit, :update]
  end
  resources :tasks, only: [:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
