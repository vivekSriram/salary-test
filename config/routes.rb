Rails.application.routes.draw do
   resources :salfiles, only: [:index, :new, :create, :destroy]
   root "salfiles#index"
end