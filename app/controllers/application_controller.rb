class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_cart
  private
  def current_cart
  	Cart.find(session[:cart_id])
  rescue	ActiveRecord::RecordNotFound
  	cart = Cart.create
  	session[:cart_id] = cart.id
  	cart
  end

  public
  def get_cart
  	@my_cart = current_cart
  end
end
