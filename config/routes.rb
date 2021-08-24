Rails.application.routes.draw do
  root to: "top#top"
  devise_for :users
  get 'users/show'
  get 'users', to: 'top#user'
  get  "contacts/send_mail"  => "contacts#send_mail"

  resources :blogs do
    resources :comments, only: [:create, :edit, :destroy]
  end

  resources :blogs
  resources :contacts


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
