Rails.application.routes.draw do
  # resources :episodes
  # resources :medical_kits
  # resources :humen
  # resources :zombies
  # resources :zombies, except: :destroy
  # resources :zombies, only: :index
  # resources :zombies, only: [:index, :show]
  # resources :humen, except: [:destroy, :edit, :update]

  # resources :zombies, only: :index
  # resources :humen, only: :index
  # resources :medical_kits, only: :index

  # with_options only: :index do |list_only|
  #   list_only.resources :zombies
  #   list_only.resources :humen
  #   list_only.resources :medical_kits
  # end 

  # resources :episodes
  # resources :zombies, constraints: { subdomain: 'api'}
  # resources :humen, constraints: { subdomain: 'api'}
  
  # resources :episodes
  # constraints subdomain: 'api' do
  #   resources :zombies
  #   resources :humen
  # end
  
  # constraints subdomain: 'api' do
  #   namespace :api, path: '/' do
  #     resources :zombies
  #   end
  # end
  
  # constraints subdomain: 'api' do
  #   namespace :api, path: '/' do
  #     resources :zombies
  #     resources :humen
  #   end
  # end
  
  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :zombies
    resources :humen
  end
  resources :pages
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
