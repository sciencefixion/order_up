Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/dishes/:id", to: "dishes#show"

   get "/chefs/:chef_id/ingredients", to: "ingredients#show"
   get "/chefs/:chef_id", to: "chefs#show"

end
