require 'faraday'
require 'json'

response = Faraday.get "http://api.openweathermap.org/data/2.5/forecast/daily?lat=24.56&lon=-81.78&cnt=07&mode=json"
json_data = response.body

temperature = JSON.parse(json_data)["list"].map { |temperature| temperature["temp"]["day"]}
description = JSON.parse(json_data)["list"].map { |weather| weather["weather"].first["description"]}

puts "The temperature of the weather for the next seven days is:"
puts temperature

puts "The description of the weather for the next seven days is:"
puts description




