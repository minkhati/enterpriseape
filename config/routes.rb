Rails.application.routes.draw do
  resources :purchases

  resources :employees

  resources :companies do 
    collection { post :import }
  end

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  get 'welcome/pricing'

  get 'welcome/features'

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  get "welcome/pricing"
  get "welcome/features"
  get "welcome/login"
  
  resources :invoices

  root to: 'welcome#index'
end
