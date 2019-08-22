   def create_sources(sources)
    sources.each {|source| Source.create(source_code: source['id'],name:source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
   end 

    def create_articles(articles)
        articles.each{|article|Article.create(source_id: Source.source_search_name(article['source']['id']).id,author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
    end 