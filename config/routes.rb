Rails.application.routes.draw do

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "hiyokos/:id/likes" => "hiyokos#likes"

  get "login" => "hiyokos#login_form"
  post "login" => "hiyokos#login"
  get "login" => "hiyokos#login_form"
  post "logout" => "hiyokos#logout"

  get "/" => "home#top"
  get "about" => "home#about"


  resources :posts
  resources :hiyokos
  resources :home

  root 'home#top'


end
