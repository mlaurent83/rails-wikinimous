Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root to: 'articles#index'


  # Resource routes for articles
  resources :articles, only: [:create, :index, :new, :edit, :show, :update]
  delete '/articles/:id', to: 'articles#destroy', as: :delete_article

end
