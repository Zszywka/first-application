Rails.application.routes.draw do

  get "/welcome", to: "welcome#index"

  resources :stories do
    member do
      post  "vote_up"
    end
  end

end
