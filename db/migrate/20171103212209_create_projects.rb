class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :wasm_filename
      t.string :wasm_content_type
      t.binary :wasm_file_contents
      t.string :js_filename
      t.string :js_content_type
      t.binary :js_file_contents

      t.timestamps null: false
    end
  end
end
