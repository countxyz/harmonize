class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.timestamps null: false

      t.string   :name,               null: false
      t.string   :employer,           null: false, default: ''
      t.string   :website,            null: false, default: ''
      t.string   :github,             null: false, default: ''
      t.string   :image_file_name,    null: false, default: ''
      t.string   :image_content_type, null: false, default: ''
      t.integer  :image_file_size,    null: false, default: ''
      t.datetime :image_updated_at,   null: false
      t.text     :notes,              null: false, default: ''
      t.string   :slug,               null: false
    end
    add_index :projects, :name
    add_index :projects, :slug, unique: true
    add_index :projects, :created_at, order: { created_at: :desc }
  end
end
