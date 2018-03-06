json.extract! upload, :id, :filename, :type, :size, :binary_id, :created_at, :updated_at
json.url upload_url(upload, format: :json)
