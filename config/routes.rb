Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        resources :find, only: [:index], controller: :search
      end
      namespace :merchants do
        resources :find_all, only: [:index], controller: :search
      end
      resources :merchants, only:[:index, :show] do
        resources :items, only:[:index]
      end
      resources :items, only:[:index, :show, :create, :update, :destroy] do
        resources :merchants, path: :merchant, as: :merchant, only:[:index]
      end
    end
  end
end
