Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  # CRUD
  resources :articles

  # VOTING
  patch '/articles/:id/upvote', to: "articles#upvote", as: :upvote

  patch '/articles/:id/downvote', to: "articles#downvote", as: :downvote


  # LOGIN
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

  # USERS
    get '/signup', to: 'users#new'
    post '/users', to: 'users#create'

end
