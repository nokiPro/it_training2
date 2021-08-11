Rails.application.routes.draw do
  resources :blogs
  get  "contacts/send_mail"  => "contacts#send_mail"
  resources :contacts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
