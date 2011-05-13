class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Mongoid::Errors::DocumentNotFound, ActionController::RoutingError, ActionView::MissingTemplate, :with => :not_found
  
  helper_method :current_user, :signed_in?
  
  private
    def not_found
      render "errors/not_found", status: :not_found
    end
    
    def current_user
      if signed_in?
        User.find cookies[:user_id]
      end
    end
    
    def signed_in?
      cookies[:user_id].present?
    end
end
