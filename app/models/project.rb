class Project < ActiveRecord::Base
    
    # app/models/document.rb
def initialize(params = {})
  wasm_file = params.delete(:wasm_file)
  js_file = params.delete(:js_file)
  super
  if wasm_file
    self.wasm_filename = sanitize_filename(wasm_file.original_filename)
    self.wasm_content_type = wasm_file.content_type
    self.wasm_file_contents = wasm_file.read
  end
  if js_file
    self.js_filename = sanitize_filename(js_file.original_filename)
    self.js_content_type = js_file.content_type
    self.js_file_contents = js_file.read
  end
end

private
  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end
end
