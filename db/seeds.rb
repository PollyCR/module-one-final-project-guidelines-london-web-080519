require 'json'
require 'rest-client'
require 'pry'
require_relative '../config/environment.rb'


def headlines 
    top_headlines = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    articles = top_headlines['articles']
    headlines = articles.map{|key,value| key['title']}
    return headlines
end 
def sources 
sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
source_hash = sources['sources']
return source_hash
source_hash.each {|source| source = Source.new}
end 
sources 
binding.pry
0

