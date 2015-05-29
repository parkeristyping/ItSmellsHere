class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session # TODO: update to protect others from posting

  def enable_location
    redirect_to 'https://support.twitter.com/articles/122236-adding-your-location-to-a-tweet'
  end

  def tweet_link
    render partial: "tweet_link"
  end

  def about
  end

end
