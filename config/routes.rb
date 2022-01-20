Rails.application.routes.draw do
  get 'top' => "home#top"
  get "post" => "home#post"
  get "bus" => "home#bus"
  get "library" => "home#library"
  get "cafe" => "home#cafe"
  get "shop" => "home#shop"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
