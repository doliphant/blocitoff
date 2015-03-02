Rails.application.routes.draw do

  get 'items/new'

  resources :lists, except: [:index] do
    resources :items, only: [:create, :destroy] do
    end
  end


  devise_for :users
  get 'welcome/index'
  get 'lists/show'

  root to: 'welcome#index'

end
