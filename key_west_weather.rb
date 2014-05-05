require 'faraday'
require 'json'


response = Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=Key%20West,us"
json_data = response.body

description = JSON.parse(json_data)["weather"].map { |description| description["description"]}
temperature = JSON.parse(json_data)["main"]["temp"]
fahrenheit = temperature * 9/5 - 459.67


#gives the current description and temperature for Key West, FL
puts "The current weather for Key West is:"
puts description, fahrenheit


