Rails.application.routes.draw do
  # -----> routes <-----
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users, only: %i[index show]
  resources :messages, only: %i[create]
  post '/auth/login', to: 'authentication#login'
  # -----> end of routes <-----
  # This is the last one for custom page not found. Important! -> LAST
  #match '*unmatched', to: 'application#page_not_found', via: :all
end
