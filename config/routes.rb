Rails.application.routes.draw do

  root 'home#top'

  get 'top' => "home#top"
  post 'top/create' => 'home#create'
  get "post" => "home#post"
  get "bus" => "home#bus"
  get "library" => "home#library"
  get "cafe" => "home#cafe"
  get "shop" => "home#shop"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
