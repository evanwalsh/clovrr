class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def not_found
      render_error('not_found', 404)
    end
    
    def render_error(view, code)
      render :template => "errors/#{view}", :status => code
    end
end
