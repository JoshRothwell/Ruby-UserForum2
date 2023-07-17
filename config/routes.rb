Rails.application.routes.draw do
  get 'github/index'
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :user_profiles, except: [:index, :destroy]

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  delete '/articles/delete/:id', to: 'articles#destroy', as: :delete_article
  delete '/comments/:id', to: 'comments#destroy', as: :delete_comment
  get 'search', to: 'articles#search'
  get '/news', to: 'news#index'
  get '/github', to: 'github#index'


end
