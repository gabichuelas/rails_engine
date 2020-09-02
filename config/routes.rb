Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/:id/items', to: 'items#index'
      end

      namespace :items do
        get '/:id/merchant', to: 'merchant#show'
        get '/find', to: 'search#show'
      end

      resources :merchants
      resources :items
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
