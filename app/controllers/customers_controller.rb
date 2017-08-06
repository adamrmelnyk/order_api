class CustomersController < ApplicationController
  before_action :set_user, only: [:orders]
  
  def show
    render json: @customer
  end

  def orders
    render json: @customer.orders
  end

  def orders_by_customer_by_product
    sql = "SELECT
      customers.id,
      customers.first_name,
      categories.name,
      COUNT( categories.id ) as number_purchased
    FROM customers
    JOIN orders ON customers.id = orders.customer_id
    JOIN products ON orders.id = products.id
    JOIN categories_products ON products.id = categories_products.product_id
    JOIN categories ON categories_products.category_id = categories.id
    GROUP BY customers.id, customers.first_name"
    ActiveRecord::Base.connection.execute(sql)
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @customer = Customer.find(params[:id])
  end
end
