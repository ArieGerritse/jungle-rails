class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    product = Product.find params[:id]
    new_rating = params[:ratings]
    product.rating.new(
      rating: new_rating[":rating"].to_i,
      description: new_rating[":description"],
      user_id: session[:user_id]
    )

    puts product

    product.save!

    redirect_to :back
  end

  private

  def rating_change
    @params = params.require(:ratings).permit(:rating, :description)
  end
end
