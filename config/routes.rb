Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    resources :projects
    resources :favorites, only: %i[index create destroy]

    resources :conversations, only: %i[index create]
    resources :messages, only: [:create]
    resources :users, only: [:index, :update]
    get '/cloud/sig/new', to: 'cloudinary#create'
    get '/search/projects', to: 'search#projects'
    get '/search/users', to: 'search#users'
    mount ActionCable.server => '/cable'
  end
end
