Rails.application.routes.draw do
  devise_for :admins
  
  authenticated :admin do
    resources :admins
  end
end
