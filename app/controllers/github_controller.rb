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
