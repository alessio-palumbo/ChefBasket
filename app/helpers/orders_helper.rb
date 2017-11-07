module OrdersHelper
  def estimate(quantity, price)
    number_to_currency(quantity * price)
  end

  def find_quantity(product)
    product.order_products.find_by(order_id: @order.id).quantity
  end

  def net_total(order_products)
    order_products.sum(&:subtotal)
  end

  def calc_gst(order_products)
    number_to_currency(net_total(order_products) / 100 * 10)
  end

  def total(order_products)
    number_to_currency(net_total(order_products) + (net_total(order_products) / 100 * 10))
  end
end
