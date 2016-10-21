Rails.application.routes.draw do
  get 'joins/create'

  get 'joins/destroy'

  get 'comments/create'

  root 'sessions#new'

  get '/events' => 'events#index'

  post '/events' => 'events#create'

  # get 'events/create'

  # get 'events/edit'

  # get 'events/update'

  get '/events/:id' => 'events#show'

  delete '/events/:id' => 'events#destroy'

  # get 'events/delete'

  get '/users/:id' => 'user#show'


  post '/users' => 'user#create'

  # get 'users/new'

  put '/users/:id' => 'user#update'

  get '/sessions/new' => 'sessions#new'

  post '/sessions' => 'sessions#login'

  delete '/sessions' => 'sessions#logout'

  post '/comments' => 'comments#create'

  post '/joins' => 'joins#create'

  delete '/joins' => 'joins#destroy'
  # get 'sessions/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
