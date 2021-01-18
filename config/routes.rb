Rails.application.routes.draw do
  

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, only: [:show, :index]

  # /categories/2
  resources :categories, only: [:show]

  namespace :admin do

    root 'products#index'
    resources :products, except: [:show]
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do 
  
      collection do      
          put :sort
      end
    end

  end


  namespace :api do 
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
    end
  end

end