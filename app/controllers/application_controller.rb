class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Mongoid::Errors::DocumentNotFound, ActionController::RoutingError, :with => :not_found
  
  private
    def not_found
      render "errors/not_found", status: :not_found
    end
end
