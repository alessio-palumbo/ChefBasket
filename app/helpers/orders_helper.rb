module OrdersHelper
  def estimate(quantity, price)
    number_to_currency(quantity * price)
  end

  def find_quantity(product)
    product.order_products.find_by(order_id: @order.id).quantity
  end

end
