Rails.application.routes.draw do
  devise_for :users, skip: :registrations

  get "/welcome", to: "welcome#index"
  root "welcome#index"

  resources :stories do
    member do
      post  "vote_up"
      get "the_same_author"
    end
    collection do
      get "top10"
      get "latest_stories"
      get "idea"
    end
  end
  
  resources :suggestions
end
