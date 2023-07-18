class AboutController < BaseInformationController
    def about
      # Prepare data specific to the about page
    end
  
    def render_page
      render 'information/about', layout: 'information'
    end
  end