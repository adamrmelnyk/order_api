class ProductsController < ApplicationController
  before_action :set_products, only: [:index]

  def index
    render json: @products
  end

  private

  def set_products
    if params["startdate"] && params["enddate"] && params["per"]
      start_date = params["startdate"].to_datetime
      end_date = params["enddate"].to_datetime
      productsArray = Order.where(created_at: start_date..end_date).flat_map { |o| o.products }
      @products = productsArray.group_by { |p| p.created_at.to_date } if params["per"] == "day"
      @products = productsArray.group_by { |p| p.created_at.strftime("%W") } if params["per"] == "week"
      @products = productsArray.group_by { |p| p.created_at.to_date.month } if params["per"] == "month"
    else
      @products = Product.all
    end
  end
end
