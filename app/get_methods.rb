def get_articles(keyword_search) 
    articles = JSON.parse(RestClient.get"https://newsapi.org/v2/everything?q=#{keyword_search}&from=2019-08-20&to=2019-08-20&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")
end

def source_search(name_search)    
    articles = JSON.parse(RestClient.get"https://newsapi.org/v2/everything?domain=#{domain}&from=2019-08-20&to=2019-08-20&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")
end

def get_headlines(source_name)
    source_for_headlines = Source.find{|source|source.name == source_name}
    url = source_for_headlines.url.sub(/^https?\:\/\/(www.)?/,'')
    source_headlines = JSON.parse(RestClient.get"https://newsapi.org/v2/everything?domains=#{url}&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")
end 