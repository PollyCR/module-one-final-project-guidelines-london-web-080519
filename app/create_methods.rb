
     def create_article(articles)
        new_articles = articles.each{|article| Article.create(source_id: Source.source_search_name(article['source']['id'])).id}
        binding.pry 
        #author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}   
    end

