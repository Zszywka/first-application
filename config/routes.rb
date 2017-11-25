Rails.application.routes.draw do

  devise_for :users
  get "/welcome", to: "welcome#index"
  root "welcome#index"

  resources :stories do
    member do
      post  "vote_up"
    end
  end

end
