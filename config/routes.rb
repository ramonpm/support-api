Rails.application.routes.draw do

  resources :tickets do
    resources :answers
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
