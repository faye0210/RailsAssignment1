Rails.application.routes.draw do
  resources :posting_pages do
    collection do
      post :confirm
    end
  end
  root to: "posting_pages#index"
end
