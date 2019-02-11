Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :parents do 
  #   resources :litter, only:[:index] do 
  #     resources :puppers, only:[:index]
  #   end 
  # end 
  get "/", to: "root#homepage", as: "homepage"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  namespace :admin do 
    resources :parents
    resources :litters, only:[:index, :show, :new, :create] do 
      resources :puppers, only: [:new, :create]
    end
    resources :puppers, only:[:index]
    resources :sessions, only:[:destroy]
    patch "/admin/toggle_sold", to: "puppers#toggle_sold", as: "toggle_sold"
  end

  resources :parents, only:[:index, :show, :new]#, :new, :create, :destroy, :edit, :update]
  resources :litters, only:[:index, :show]#, :new, :create]
  resources :puppers, only:[:index]#, :new, :create]
end
