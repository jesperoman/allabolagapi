Allabolagapi::Application.routes.draw do
  get "search/index"
  post "search/index"
  root 'search#index'
end
