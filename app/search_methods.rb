def search_sources_by_category 
    prompt = TTY::Prompt.new
        category_search = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))	  
       Source.source_search_by_category(category_search.downcase)
        prompt = TTY::Prompt.new 
        search_results = Source.source_search_by_category(category_search.downcase)
        # binding.pry
        to_save = prompt.select("Please choose from the following sources:",search_results)
        #binding.pry
        save_source?(to_save, $current_user)
        welcome_options
end

def search_articles 
    prompt = TTY::Prompt.new 
    keyword_search = prompt.ask("Please enter the article keyword", required: true)
    prompt = TTY::Prompt.new 
    articles_with_keyword = Article.where('content LIKE ?',"%#{keyword_search}%").all
    article_titles = articles_with_keyword.map{|article|article.title}
    article_selection = prompt.select("The following articles were found:", articles_with_keyword.title)
         article_to_save = Article.find_by(title: article_selection).id
         save_article?(article_to_save, $current_user)
         welcome_options
end