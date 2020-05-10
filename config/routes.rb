Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/shelters', to: 'shelters#index'
  delete '/shelters', to: 'shelters#destroy'
  post '/shelters', to: 'shelters#create'

  get '/shelters/new', to: 'shelters#new'

  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id', to: 'shelters#show'
  put '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  post '/pets/:pet_id', to: 'pets#update'
  get '/pets/:pet_id', to: 'pets#show'
  get '/pets/:pet_id/edit', to: 'pets#edit'

  delete '/pets/:pet_id', to: 'pets#destroy'

  get 'shelters/:shelter_id/pets', to: 'pets#index_specific'
  post 'shelters/:shelter_id/pets', to: 'pets#create'
  get 'shelters/:shelter_id/pets/new', to: 'pets#new'


end
