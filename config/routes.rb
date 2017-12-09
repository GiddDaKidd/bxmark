Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
    get 'about', to: 'about#index'
    get 'services', to: 'services#index'
    get 'contact', to: 'contact#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
