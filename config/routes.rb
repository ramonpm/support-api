Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :tickets do
    collection do
      get 'pdf_report'
    end

    member do
      put 'finish'
    end

    resources :answers
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
