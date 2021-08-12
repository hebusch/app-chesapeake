Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations' 
  }, 
  path: '', path_names: {
    sign_in: 'login', 
    sign_out: 'logout', 
    sign_up: 'register'
  }

  get 'import', action: :new, controller: 'lotes'
  
end
