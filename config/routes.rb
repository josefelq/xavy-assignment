Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'venues#index'
  get :home, to: 'pages#home'

  namespace :admin do
    get '/' => 'activities#index'
    resources :activities
    resources :venues
    resources :tags
  end

  resources :venues, only: [:index, :show]
end
