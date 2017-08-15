class ApplicationController < ActionController::Base
  # Update the application controller with new methods
  # to look up the user, if they're logged in, and save their user object
  # to a variable called @current_user.
  # The helper_method line below current_user allows us to use
  # @current_user in our view files.
  # Authorize is for sending someone to the login page if they aren't logged in
  # - this is how we keep certain pages our site secure...
  # user's have to login before seeing them.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  # Add a before_filter to any controller that you want to secure.
  # This will force user's to login before they can see the actions in this controller.
  # I've created a gif controller below which I'm going to secure.
  # The routes for this controller were added to the routes.rb in the beginning of this tutorial.

end
