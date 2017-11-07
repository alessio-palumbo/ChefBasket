json.extract! product, :id, :supplier_id, :order_id, :category, :name, :quantifier, :stock_level, :price, :discount, :created_at, :updated_at
json.url product_url(product, format: :json)
