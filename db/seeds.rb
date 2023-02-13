require "net/http"
require 'uri'
require 'json'
# hardcoded because it won't be changed during this projects life
uri = URI('https://hacker-news.firebaseio.com/v0/newstories.json')
ids = JSON.parse(Net::HTTP.get_response(uri).body)
# puts ids.body if ids.is_a?(Net::HTTPSuccess)

puts ids.count;
ids.each{
    |id| 
    uri = URI("https://hacker-news.firebaseio.com/v0/item/#{id}.json")
    response = Net::HTTP.get_response(uri).body

    puts id
    if response != nil
        Article.create(JSON.parse(response))
    end
}