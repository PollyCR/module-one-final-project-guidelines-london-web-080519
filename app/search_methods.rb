def search_sources_by_category 
    prompt = TTY::Prompt.new
        category_search = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))	  
       Source.source_search_by_category(category_search.downcase)
        prompt = TTY::Prompt.new 
        search_results = Source.source_search_by_category(category_search.downcase)
        # binding.pry
        to_save = prompt.select("Please choose from the following sources:",search_results)
        #binding.pry
        save_prompt(to_save, $current_user)
        welcome_options
end

def search_sources_by_name 
    prompt = TTY::Prompt.new 
    name_search = prompt.ask("Please enter the name of the source you wish to find:")
    Source.source_search_by_name(name_search)
end 

def search_sources
    prompt = TTY::Prompt.new 
    selection = prompt.select("Would you like to search by name, or by category?",["Search by name","Search by category"])
if selection.include?("name")
    search_sources_by_name
elsif selection.include?("category")
        search_sources_by_category
    end
    welcome_options
end 

def search_articles 
    prompt = TTY::Prompt.new 
    keyword_search = prompt.ask("Please enter the article keyword")
    prompt = TTY::Prompt.new 
    articles_with_keyword = get_articles(keyword_search)
    article_list = articles_with_keyword.select{|array|array['articles']}.values[0]
    # .values[0]
    # binding.pry
    create_articles(article_list)
    articles = prompt.select("Articles matching your search:",matching_keyword)
    article_content = Article.find{|article|article.title == articles}.content
    puts article_content
        save_article(articles, $current_user)
end