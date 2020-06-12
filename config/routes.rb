Rails.application.routes.draw do
  
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/hobbies'
  get 'welcome/pictures'

  resources :articles

  get 'articles/new'

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
