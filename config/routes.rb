Rails.application.routes.draw do
  get 'current_user', to: 'current_user#index'
  get 'all_users', to: 'current_user#all_users'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
