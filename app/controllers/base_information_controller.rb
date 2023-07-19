class BaseInformationController < ApplicationController
  layout 'information'

  # This method is meant to be implemented in specific information controllers
  def prepare_data
    # To be implemented in the specific information controllers
  end

  # This method renders the page based on the current action
  def render_page
    render "information/#{params[:action]}", layout: 'information'
  end      
end
