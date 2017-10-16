class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def add_rating(rating_change)
    product = Product.find params[:id]
    product.rating.new(
      user: rating_change.id,
      rating: rating_change.rating,
      descrption: rating_change.review
    )
  end
end
