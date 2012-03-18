class LoginController < ApplicationController
  skip_before_filter :redirect_to_login_page_unless_logged_in

  def new
    @user = User.new
  end

  def create
    session[:ein] = params[:user][:ein]
    redirect_to session.delete(:path) || :root
  end

  def destroy
    session[:ein] = nil
    redirect_to :login
  end
end
