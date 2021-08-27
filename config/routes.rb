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
  resources :lotes do
    collection do
      get :upload, action: 'upload_form'
      post :upload, action: 'upload_process'
    end
  end
  resources :receptions do
    collection do
      post :search, action: 'search'
    end
  end
end
