Yupp::Application.routes.draw do
  resources :users, :only => [:index, :show, :edit, :update]
   
  resources :ideas do
    get :recent, :on => :collection
    get :popular, :on => :collection 
  end
  
  match 'login' => 'sessions#login'
  match 'logout' => 'sessions#logout'
  match 'auth/:provider/callback' => 'sessions#create'
  match 'search' => 'search#index'

  root :to => 'ideas#popular'
end
