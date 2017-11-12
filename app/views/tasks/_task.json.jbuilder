json.extract! task, :id, :filename, :content_type, :file_contents, :project_id, :times_executed, :created_at, :updated_at
json.url task_url(task, format: :json)
