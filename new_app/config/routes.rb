Rails.application.routes.draw do
  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :zombies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
