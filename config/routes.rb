Rails.application.routes.draw do
  root to: "top#top"
  get 'users', to: 'top#users'
  devise_for :users
  resources :blogs
  get  "contacts/send_mail"  => "contacts#send_mail"
  resources :contacts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
