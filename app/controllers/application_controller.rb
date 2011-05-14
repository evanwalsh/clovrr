class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Mongoid::Errors::DocumentNotFound, ActionController::RoutingError, ActionView::MissingTemplate, :with => :not_found
  
  helper_method :current_user, :signed_in?
  
  layout 'application'
  
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
    
    def guests_only
      if signed_in?
        redirect_to root_url, notice: "Only people who aren't signed in can go there."
      end
    end
    
    def users_only
      if !signed_in?
        redirect_to root_url, notice: "Only people who are signed in can go there. Sorry."
      end
    end
end
