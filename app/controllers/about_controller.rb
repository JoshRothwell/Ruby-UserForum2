class AboutController < BaseInformationController
    def about
      # Prepare data specific to the about page
    end
  
    # Method that calls upon the application to render the content of the information page.
    def render_page
      render 'information/about', layout: 'information'
    end
  end