require 'httparty'

class GithubController < ApplicationController
  def index
    @projects = fetch_github_projects
  end

  private

  # Fetches the user's GitHub projects using the GitHub API
  def fetch_github_projects
    username = 'JoshRothwell'
    token = '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'
    url = "https://api.github.com/users/#{username}/repos"
    headers = { 'Authorization' => "Bearer #{token}" }
    response = HTTParty.get(url, headers: headers)
    response.parsed_response
  end
end
