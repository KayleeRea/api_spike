require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load


connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects/1071984/stories?"

response = connection.get do |req|
  req.url "https://www.pivotaltracker.com/services/v5/projects/1071984/stories?"
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

story = JSON.parse(json_data).map {|story| story["name"]}

p story