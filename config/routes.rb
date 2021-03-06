Rails.application.routes.draw do
  devise_for :admins, path: ''
  
  root to: 'home#index'
  
  devise_scope :admin do
    get 'login', to: 'devise/sessions#new', as: :new_main_admin_session
    post 'login', to: 'devise/sessions#create', as: :main_admin_session
    delete 'logout', to: 'devise/sessions#destroy', as: :main_admin_destroy
  end

  authenticated :admin do
    resources :admins
    resources :profiles
    resources :skills
    resources :contacts
  end

end
