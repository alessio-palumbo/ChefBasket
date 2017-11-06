json.extract! order, :id, :date, :food_business_id, :supplier_id, :gross_total, :gst, :order_number, :created_at, :updated_at
json.url order_url(order, format: :json)
