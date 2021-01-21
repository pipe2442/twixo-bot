require 'telegram/bot'
require 'net/http'
require 'json'
require 'dotenv'

Dotenv.load('token.env')

class Source
  NEWS_API = ENV['SOURCE']
  @url = nil

  def define_url(topic)
    @url = 'http://newsapi.org/v2/top-headlines?'\
    "sources=#{topic}&"\
    "apiKey=#{NEWS_API}"
    @url
  end

  def retrieve_json
    uri = URI(@url)
    res = Net::HTTP.get(uri)
    JSON.parse(res)
  end

  def filter_json(json)
    json['articles']
  end
end
