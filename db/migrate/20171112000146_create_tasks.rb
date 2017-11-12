class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :project, index: true, foreign_key: true
      t.integer :times_executed

      t.timestamps null: false
    end
  end
end
