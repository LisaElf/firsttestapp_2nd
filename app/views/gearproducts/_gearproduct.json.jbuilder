json.extract! gearproduct, :id, :name, :description, :image_url, :gear_type, :created_at, :updated_at
json.url gearproduct_url(gearproduct, format: :json)
