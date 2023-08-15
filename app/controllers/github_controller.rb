require 'httparty'

class GithubController < ApplicationController
  def index
    @projects = fetch_github_projects
  end

  private

  # Fetches the user's GitHub projects using the GitHub API, it utilises a fine-grained github API key.
  # ///IMPORTANT///
  # If this feature stops working, there is a chance the API key may have expired prematurely
  # If this occours, please let me know and I can create a new key and push a fix to the Github Repository.
  def fetch_github_projects
    username = 'JoshRothwell'
    token = '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'
    url = "https://api.github.com/users/#{username}/repos"
    headers = { 'Authorization' => "Bearer #{token}" }
    response = HTTParty.get(url, headers: headers)
    response.parsed_response
  end
end
