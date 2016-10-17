Rails.application.routes.draw do

  resources :iterations
  resources :ratings, :only => %q(new create)
  post '/' => 'ratings#new'

  resources :iterations, :except => :destroy

end
