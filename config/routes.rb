Rails.application.routes.draw do
  root                                   'parks#index'
  # root                                   'main_pages#landing'
  get     'help'                      => 'main_pages#help'
  get     'about'                     => 'main_pages#about'
  get     'contact'                   => 'main_pages#contact'
  get     'landing'                   => 'main_pages#landing'
  get     'signup'                    => 'users#new'
  get     'login'                     => 'sessions#new'
  post    'login'                     => 'sessions#create'
  get     '/auth/:provider/callback'  => 'sessions#create'
  delete  'logout'                    => 'sessions#destroy'
  get     'parks_list'                => 'parks#parks_list'
  resources :users
  resources :account_activations,   only: [:edit]
  resources :password_resets,       only: [:new, :create, :edit, :update]

  resources :parks, only: [:index, :show] do
    resources :games, only: [:index, :show, :create, :destroy]
  end
  resources :game_participations,   only: [:update, :destroy]
  resources :messages,              only: [:create]
end
