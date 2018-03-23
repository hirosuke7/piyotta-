Rails.application.routes.draw do

  resources :posts
  root "home#top"
  resources :hiyokos

  get "/" => "home#top"
  get "about" => "home#about"
end
