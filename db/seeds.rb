require './config/environment.rb'
require 'pry'
# Source.destroy_all



def sources 
sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
# binding.pry
source_hash = sources['sources']
source_hash.each {|source| Source.create(name:source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
# binding.pry
end 
sources

def articles
    articles = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    article_hash = articles['articles']
    # binding.pry
    article_hash.each {|article| Article.create(author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
    # binding.pry
end 
    articles

def headlines 
    response = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    data = response['articles']
    headlines = data.map{|key,value| key['title']}
    return headlines
end 

