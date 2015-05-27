class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :brands
  before_filter :categories

def brands 
	products = Product.all
	@brands = []
  products.each do |product|
   	if @brands.include?(product.brand) == false
   		@brands.push(product.brand)
   	end 
   end
	return @brands 
end

def remote_ip
  if request.remote_ip == '127.0.0.1'
    "#{ENV['my_url']}"
  else
    request.remote_ip
  end 
end 


def categories 
	@categories = Category.all
	return @categories 
end 


end


