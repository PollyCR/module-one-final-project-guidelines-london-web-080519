require './config/environment.rb'
require 'pry'
Source.destroy_all
Article.destroy_all

def sources 
    sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    source_hash = sources['sources']
    # binding.pry
    create_sources(source_hash)
    end 
    sources

def articles
    articles = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    article_hash = articles['articles']
    # binding.pry
    create_article(article_hash)
# binding.pry
end 
articles

def find_source_name(name)
sources.select{|source|source.name==name}
end 

