Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :user_id, !types.Int
  field :content, !types.String
  field :post_id, !types.Int
  field :comments_count, !types.Int

  def comments_count
    object.comments.count
  end
end
