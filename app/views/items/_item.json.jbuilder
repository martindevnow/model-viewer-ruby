json.extract! item, :id, :name, :description, :directory, :item_name, :relative_path, :design_id, :created_at, :updated_at
json.url item_url(item, format: :json)
