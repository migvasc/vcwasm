class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
