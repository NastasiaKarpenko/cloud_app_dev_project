Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  
get "articles" => "articles#index"
post "articles/new" => "articles#new"
get "articles/:id" => "articles#show"
put "articles/:id/edit" => "articles#edit"
post "articles" => "articles#create"
patch "articles/:id" => "articles#update"
delete "articles/:id" => "articles#destroy"

get "up" => "rails/health#show", as: :rails_health_check

end
