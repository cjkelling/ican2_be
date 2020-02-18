<<<<<<< HEAD
=======
require 'types/mutation_type'
require 'types/query_type'

>>>>>>> 8bfe674058df5107bb6af40de8bad0d8e8645a68
class Ican2BeSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
