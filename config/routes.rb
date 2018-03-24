Rails.application.routes.draw do

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  resources :likes, only: [:create, :destroy]


  get "login" => "hiyokos#login_form"
  post "login" => "hiyokos#login"
  get "login" => "hiyokos#login_form"

  post "logout" => "hiyokos#logout"
  get "hiyokos/:id/likes" => "hiyokos#likes"


  resources :posts

  root "home#top"
  resources :hiyokos

  get "/" => "home#top"
  get "about" => "home#about"
end
