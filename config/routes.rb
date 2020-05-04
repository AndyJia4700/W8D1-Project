Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users #do
    # resources :subs, only:[:edit, :update, :new, :create, :destroy]
  #end

  resources :subs do
    resources :posts, only: [:index]
  end

  resources :posts

  resource :session, only: [:new, :create, :destroy]

  

end
