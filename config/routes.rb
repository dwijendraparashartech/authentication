Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  get 'sign_up',to:'registrations#new'
  post 'sign_up',to:'registrations#create'
  get 'sign_in',to:'sessions#new'
  post 'sign_in',to:'sessions#create',as: 'log_in'
  delete 'log_out',to:'sessions#destroy'
  get 'password',to:'password#edit',as:'edit_password'
  patch 'passwotd',to:'password#update'
  get 'password/reset',to:'password_reset#new'
  post 'password/reset',to:'password_reset#edit'
  patch 'password/reset/edit',to:'password_reset#update'
end
