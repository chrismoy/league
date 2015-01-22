Rails.application.routes.draw do
  get 'main_pages/home'

  get 'main_pages/help'

  root 'application#hello'
end
