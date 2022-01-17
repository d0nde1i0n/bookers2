Rails.application.routes.draw do

  devise_for :users #deviseをしようする際にURLとして、usersを含むことを示す
  root :to => "homes#top" # ルートパスをtopアクションと紐付け
  get "home/about" => "homes#about"
  #resourcesコマンドで自動生成するルーティングをonlyオプションで制限
  resources :users,only:[:index,:create,:show,:edit,:update]
  resources :books,only:[:index,:create,:show,:edit,:update,:destroy]

end
