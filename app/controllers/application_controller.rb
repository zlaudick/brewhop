class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "hello, world!"
  end

  def home
    @micropost = current_brewery.microposts.build if brewery_logged_in?
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  private

    # confirms a logged-in brewery.
    def logged_in_brewery
      unless brewery_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
