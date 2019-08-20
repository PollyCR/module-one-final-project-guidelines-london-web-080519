require './config/environment.rb'

def sources 
sources = JSON.parse(RestClient.get 'https://newsapi.org/v2/sources?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
source_hash = sources['sources']
binding.pry
source_hash.each {|source| source = Source.new}
end 
sources

def headlines 
    response = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad')
    data = response['articles']
    headlines = data.map{|key,value| key['title']}
    return headlines
end 

