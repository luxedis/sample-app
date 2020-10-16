Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'tasks/index', to: 'tasks#show'
  get 'tasks/:id', to: 'tasks#show', as: :task
  
  resources :users do
    resources :tasks
  end
end
