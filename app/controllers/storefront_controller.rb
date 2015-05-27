class StorefrontController < ApplicationController

  def all_items
  	@products = Product.all
  	@categories = Category.all

  end

  def items_by_category
  	@categories = Category.all

  	@category = Category.find(params[:id])
  	@products = Product.where(category_id: params[:id])
  end

  def items_by_brand
  	@categories = Category.all

  	@brand = params[:brand]
  	@products = Product.where(brand: @brand)
  end
end
