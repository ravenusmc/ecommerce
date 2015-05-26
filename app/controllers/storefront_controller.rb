class StorefrontController < ApplicationController

  def all_items
  	@products = Product.all
  	@categories = Category.all
  	@brands = []
  	@products.each do |product|
  		if @brands.include?(product.brand) == false
  			@brands.push(product.brand)
  		end 
  	end
  end

  def items_by_category
  	@categories = Category.all
  	 	@brands = []
  	Product.all.each do |product|
  		if @brands.include?(product.brand) == false
  			@brands.push(product.brand)
  		end 
  	end

  	@category = Category.find(params[:id])
  	@products = Product.where(category_id: params[:id])
  end

  def items_by_brand
  	@categories = Category.all
  	 	@brands = []
  	Product.all.each do |product|
  		if @brands.include?(product.brand) == false
  			@brands.push(product.brand)
  		end 
  	end

  	@brand = params[:brand]
  	@products = Product.where(brand: @brand)
  end
end
