Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "auctions#index"
  resources :auctions do
    resources :bids do
      put :select_winner
    end
  end

  namespace :api do
    namespace :v1 do
      resources :auctions, only: [:index, :show]
    end
  end



end
