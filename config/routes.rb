Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/:id/items', to: 'items#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/find', to: 'search#
        show'
        get '/find_all', to: 'search#index'
        get '/most_items', to: 'ranking#most_items_sold'
        get '/most_revenue', to: 'ranking#most_revenue'
      end

      namespace :items do
        get '/:id/merchant', to: 'merchant#show'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      resources :merchants
      resources :items

      get '/revenue', to: 'revenue#index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
