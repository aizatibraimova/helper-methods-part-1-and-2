Rails.application.routes.draw do
  root "movies#index"
  # get "/",  controller: "movies", action: "index" 

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create" 
  # post "/movies", controller: "movies", action: "create"
  get "/movies/new" => "movies#new"
  # get "/movies/new", controller: "movies", action: "new"
          
  # READ
  get "/movies" => "movies#index"
  # get "/movies", controller: "movies", action: "index" 
  get "/movies/:id" => "movies#show"
  # get "/movies/:id", controller: "movies", action: "show" 
  
  # UPDATE
  patch "/movies/:id" =>"movies#update"

  get "/movies/:id/edit" =>"movies#edit"
  
  # DELETE
  delete "/movies/:id" =>"movies#destroy"

  #------------------------------
end
