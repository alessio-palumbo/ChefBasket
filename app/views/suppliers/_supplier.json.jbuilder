json.extract! supplier, :id, :business_name, :address, :abn_number, :contact_number, :supplier_type, :user_id, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
