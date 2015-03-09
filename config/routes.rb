Rails.application.routes.draw do
  root                   'parks#index'
  get     'help'      => 'main_pages#help'
  get     'about'     => 'main_pages#about'
  get     'contact'   => 'main_pages#contact'
  get     'signup'    => 'users#new'
  get     'login'     => 'sessions#new'
  post    'login'     => 'sessions#create'
  delete  'logout'    => 'sessions#destroy'
  resources :users
  resources :account_activations,   only: [:edit]
  resources :password_resets,       only: [:new, :create, :edit, :update]
  resources :games,                 only: [:index, :show, :create, :destroy]
  resources :parks,                 only: [:index, :show]
  resources :game_participations,   only: [:update, :destroy]
end
