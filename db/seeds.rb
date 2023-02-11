require "net/http"

# hardcoded because it won't be changed during this projects life
uri = URI.parse('https://hacker-news.firebaseio.com/v0/newstories.json') 

ids = JSON.parse(Net::HTTP.get_response(uri).body)

puts ids.length
ids.each{
    |id| 
    uri = URI.parse("https://hacker-news.firebaseio.com/v0/item/#{id}.json")
    response = Net::HTTP.get_response(uri).body
    if response != nil
        Article.create(JSON.parse(response))
    end
}