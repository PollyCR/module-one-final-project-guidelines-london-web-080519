require './config/environment.rb'
require 'pry'
Source.destroy_all
Article.destroy_all

all_sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')['sources']

all_sources.each do |source|
    current_source = Source.create(name: source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])
    source_articles = JSON.parse(RestClient.get "https://newsapi.org/v2/everything?sources=#{source['id']}&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")['articles']
    source_articles.each do |article|
        Article.create(source_id: current_source.id, author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'], content: article['content'])
    end
end
# $all_articles = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')['articles']

# $all_sources.each{|source|Source.create(source_code: source['id'],name: source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
# $all_articles.each{|article|Article.create(source_code_string: Source.source_search_code(article['source']['id'])['source_code'], author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'], content: article['content'])}


def find_source_name(name)
sources.select{|source|source.name==name}
end 


