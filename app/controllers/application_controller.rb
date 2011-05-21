class ApplicationController < ActionController::Base
  protect_from_forgery
  # rescue_from Mongoid::Errors::DocumentNotFound, ActionController::RoutingError, :with => :not_found
  
  helper_method :current_user, :signed_in?, :admin?
  
  layout 'blog'
  theme :get_theme
  
  private
    def not_found
      render "errors/not_found", status: :not_found
    end
    
    def get_theme
      Preference.get 'theme'
    end
    
    def current_user
      if signed_in?
        User.where(password_digest: cookies[:remember_me]).first
      end
    end
    
    def signed_in?
      cookies[:remember_me].present?
    end
    
    def admin?
      signed_in? and current_user.admin?
    end
    
    def guests_only!
      if signed_in?
        flash[:error] = 'Only people who aren\'t signed in can go there.'
        redirect_to root_url
      end
    end
    
    def users_only!
      if !signed_in?
        flash[:error] = 'Only people who are signed in can go there. Sorry.'
        redirect_to root_url
      end
    end
    
    def admins_only!
      if !admin?
        flash[:error] = 'Only admins can go there. Sorry.' 
        redirect_to sign_in_url
      end
    end
end
