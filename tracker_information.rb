require 'faraday'
require 'json'
require 'dotenv'
Dotenv.load


connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects"

response = connection.get do |req|
  req.url "https://www.pivotaltracker.com/services/v5/projects"
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

projects = JSON.parse(json_data).map {|name| name["name"]}

p projects