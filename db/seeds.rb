require './config/environment.rb'
require 'pry'
# Source.destroy_all

$article_hash
def articles
    articles = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    article_hash = articles['articles']
    article_hash.each {|article| Article.create(source_id: Source.source_search_name(article['source']['id']), author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
end 
articles


def sources 
sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
source_hash = sources['sources']
source_hash.each {|source| Source.create(source_code: source['id'],name:source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
end 
sources

def find_source_name(name)
sources.select{|source|source.name==name}
end 


