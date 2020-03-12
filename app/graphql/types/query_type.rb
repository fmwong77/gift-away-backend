Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :comments, !types[Types::CommentType] do
    resolve -> (obj, args, ctx) {
      Comment.all
    }
  end

  field :comment_count, !types[Types::PostType] do
    argument :count, types.Int, default_value: 0, prepare: -> (count) {[count, 0].min}
    resolve -> (obj, args, ctx) {
      
    }
  end

  # def comments
  #   Comment.all
  # end

  # field :comment, Types::CommentType, null: false do
  #   argument :id ID, required: true
  # end

  # def comment(id:)
  #   Comment.find(id)
  # end
end
