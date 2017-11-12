json.extract! result, :id, :filename, :content_type, :file_contents, :task_id, :created_at, :updated_at
json.url result_url(result, format: :json)
