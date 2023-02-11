module Types
  class QueryType < Types::BaseObject
    field :first_page_articles, [Types::ArticleType], null: false do
      description 'Retrieve all articles'
    end
    field :retrieve_page_articles, [Types::ArticleType], null: false do
      description 'Retrieve page results for requested articles'
      argument :page, Integer, required: true
    end

    def first_page_articles
      Article.all.limit(30).where.not(url: nil).order(created_at: :desc)
    end

    def retrieve_page_articles(page:)
      puts 'getpage'
      Article.all.limit(30).offset(page * 30).order(created_at: :desc)
    end
  end
end
