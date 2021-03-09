Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :orders #, except:[:new, :edit, :update, :destroy ]

  resources :products, only: [:show, :index]
  
  resources :pay do

    member do
      post :payment
    end

  end
  
  # /categories/2
  resources :categories, only: [:show, :destroy]

  # /cart
  resource :cart do 
    
    # /cart/checkout
    collection do
      get :checkout
    end
  end

  namespace :admin do

    root 'products#index'
    resources :products, except: [:show]  #TBD: delete :delete_attachment
    
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do 
  
      collection do      
          put :sort
      end
    end

  end

  # api
  namespace :api do 
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
      post 'cart', to: 'utils#cart'
    end
  end

end