require 'json'
require 'rest-client'
require 'pry'

top_headlines = JSON.parse(RestClient.get 'https://newsapi.org/v2/top-headlines?country=gb&apiKey=18f1d787fdf24f74b097f41574c6dbad')
$articles = top_headlines['articles']
def headlines 
    headlines = $articles.map{|k,v| k['title']}
    return headlines
end 
# binding.pry
0
