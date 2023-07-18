class BaseInformationController < ApplicationController
    layout 'information'
  
    def prepare_data
      # To be implemented in the specific information controllers
    end
  
    def render_page
        render "information/#{params[:action]}", layout: 'information'
    end      
  end
  