Rails.application.routes.draw do

  devise_for :users
  get 'homes/top'
  root :to => "homes#top"
  resources :users,only:[:index,:show,:edit]
  resources :books,only:[:index,:show,:edit]

end
