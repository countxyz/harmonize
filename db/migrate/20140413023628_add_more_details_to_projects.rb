class AddMoreDetailsToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true
    add_index     :projects, :created_at, order: { created_at: :desc }
  end
end
