Rails.application.routes.draw do

  resources :ratings, :only => %q(new create)
  post '/' => 'ratings#new'

end
