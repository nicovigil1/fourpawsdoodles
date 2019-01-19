class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def find_parents(parents)
  #   ans = []
  #   parents.each do |parent|
  #     ans << Parent.find_by(name: parent.upcase)
  #   end
  #   ans
  # end 

  def current_admin?
    render_404 unless current_user && current_user.admin? 
  end 

  def render_404
    render file: 'public/404.html'
  end 
end
