Rails.application.routes.draw do
  resources :books, only: :index
  resources :finished_books
  resources :genres
end
