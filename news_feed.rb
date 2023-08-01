require 'httparty'

# This file is responsible for the initialisation of the GNews API, this is where the data from
# The news feed is currently set to filter news articles that are tagged under "technology"

def fetch_news_articles
  api_key = 'b05bfa6ab56783e5d4854dd137093fb6'
  query = 'technology'
  url = "https://gnews.io/api/v4/search?q=#{query}&token=#{api_key}"

  response = HTTParty.get(url)
  articles = response.parsed_response['articles']

  articles.each do |article|
    puts article['title']
    puts article['description']
    puts article['url']
    puts '---'
  end
end

fetch_news_articles

