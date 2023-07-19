Rails.application.routes.draw do
  get 'github/index'
  devise_for :users

  # Handles Devise sessions
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # The resources for user profiles, allows them to be destroyed when a user is deleted from records.
  resources :user_profiles, except: [:index, :destroy]

  # The resources for articles and comments, this allows comments to be deleted and deletes them when an article is destroyed.
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  # Route for deleting articles and comments.
  delete '/articles/delete/:id', to: 'articles#destroy', as: :delete_article
  delete '/comments/:id', to: 'comments#destroy', as: :delete_comment
  # Route for the search bar
  get 'search', to: 'articles#search'
  # Route for the news and github data source pages.
  get '/news', to: 'news#index'
  get '/github', to: 'github#index'
  # Route for the information page that utilizes the Template
  get '/information/welcome', to: 'welcome#show'
  get '/information/about', to: 'about#show'
  get '/welcome', to: 'welcome#welcome', as: 'welcome'
  get '/about', to: 'about#about', as: 'about'




end
