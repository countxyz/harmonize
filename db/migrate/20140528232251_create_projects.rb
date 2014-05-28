class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name
      t.string   :employer
      t.string   :website
      t.string   :github
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.text     :notes
      t.string   :slug

      t.timestamps
    end
    add_index :projects, :name
    add_index :projects, :slug, unique: true
    add_index :projects, :created_at, order: { created_at: :desc }
  end
end
