require "net/http"
require 'uri'

# hardcoded because it won't be changed during this projects life
uri = URI('https://hacker-news.firebaseio.com/v0/newstories.json')
ids = Net::HTTP.get_response(uri)
# puts ids.body if ids.is_a?(Net::HTTPSuccess)


# puts ids.length
ids.each{
    |id| 
    uri = URI("https://hacker-news.firebaseio.com/v0/item/#{id}.json")
    response = Net::HTTP.get_response(uri).body

    if response != nil
        Article.create(JSON.parse(response))
    end
}