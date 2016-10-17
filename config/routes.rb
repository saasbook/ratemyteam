Rails.application.routes.draw do

  resources :iterations
  resources :ratings, :only => %q(new create) do
    get :error, :on => :collection, :as => 'error'
  end
  post '/' => 'ratings#new'

  resources :iterations, :except => :destroy

end
