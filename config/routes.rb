Rails.application.routes.draw do
<<<<<<< HEAD
=======
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
>>>>>>> 8bfe674058df5107bb6af40de8bad0d8e8645a68
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
