module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: true
    field :author, String, null: true
    field :text, String, null: true
    # field :dead, Boolean, null: true
    field :url, String, null: true
    field :score, Integer, null: true
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def author
      object.by
    end
  end
end
