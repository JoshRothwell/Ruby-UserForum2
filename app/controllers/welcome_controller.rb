class WelcomeController < BaseInformationController
    def welcome
      # Prepare data specific to the welcome page
    end
  
    def render_page
      render 'information/welcome', layout: 'information'
    end
  end