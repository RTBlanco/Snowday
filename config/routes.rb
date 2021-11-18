Rails.application.routes.draw do

  root "locations#index"
  resources :locations do 
    resources :reports
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
