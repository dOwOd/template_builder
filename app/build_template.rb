require 'erb'
require 'json'

layout = "layout.html.erb"
raw_response = File.read('response.json')
response = JSON.parse(raw_response)
services = response['services']
libraries = response['libraries']

content = ERB.new(File.read('index.html.erb')).result(binding)
result = ERB.new(File.read(layout)).result(binding)

File.open('versions.html', 'w') do |file|
  file.puts result
end