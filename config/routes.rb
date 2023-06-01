Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show]    
      resources :authors, only: %i[index show create update destroy]    
      resources :profile, only: %i[show create update]    
      resources :reviews, only: %i[show create]    
    end  
  end 
  
end
