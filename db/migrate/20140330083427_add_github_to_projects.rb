class AddGithubToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github, :string
  end
end
