class MainPagesController < ApplicationController
  
  def home
    @projects = Project.where "status = ?", "In Progress"
  end
end
