require 'httparty'

def fetch_public_projects
  username = 'JoshRothwell'
  token = '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'
  url = "https://api.github.com/users/#{username}/repos"
  headers = { 'Authorization' => "Bearer #{token}" }
  response = HTTParty.get(url, headers: headers)
  response.parsed_response
end

projects = fetch_public_projects

projects.each do |project|
  puts "Project Name: #{project['name']}"
  puts "Description: #{project['description']}"
  puts "URL: #{project['html_url']}"
  puts '---'
end
