json.extract! project, :id, :name, :description, :wasm_filename, :wasm_content_type, :wasm_file_contents, :js_filename, :js_content_type, :js_file_contents, :created_at, :updated_at
json.url project_url(project, format: :json)
