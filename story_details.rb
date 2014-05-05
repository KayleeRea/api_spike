require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load


connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects/1071984/stories/70678350"

response = connection.get do |req|
  req.url "https://www.pivotaltracker.com/services/v5/projects/1071984/stories/70678350"
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

story_names = JSON.parse(json_data)["name"]
description = JSON.parse(json_data)["description"]


p "Story name: " "#{story_names}",  "Description of story: " "#{description}"
