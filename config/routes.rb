Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "users#show"
  resources :books, only: [:index, :show] do
    resources :articles, only: [:show]
  end
end
