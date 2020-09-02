Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants
      resources :items

      namespace :merchants do
        get '/:id/items', to: 'items#index'
      end

      namespace :items do
        get '/:id/merchant', to: 'merchant#show'
      end
    end



    # namespace :items do
    #   get '/:id/merchant', to: 'merchant#show'
    # end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
