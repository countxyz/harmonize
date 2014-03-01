class MainPagesController < ApplicationController

  def home
    @time = Time.new
    @day = @time.strftime("%A")
    @date = @time.strftime("%B %e, %Y")
  end

  def about; end
end
