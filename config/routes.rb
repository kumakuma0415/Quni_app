Rails.application.routes.draw do

  root 'home#top'

  get '/' => "home#top"
  post 'top/create' => 'home#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
