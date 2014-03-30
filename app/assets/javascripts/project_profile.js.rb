require 'opal-jquery'

class ProjectProfile

  def find_new_assignment
    Element.find('#new_assignment')
  end

  def hide_project_profile
    Element.find('.project_profile').hide
  end

  def fade_in_assignment_form
    Element.find('.assignment_form').effect(:fade_in)
  end

  def click_new_assignment
    find_new_assignment.on :click do |click|
      hide_project_profile
      fade_in_assignment_form
      click.stop_propagation
    end
  end

  def provide_functionality
    Document.on 'page:change' do
      click_new_assignment
    end
  end
end

profiler = ProjectProfile.new
profiler.provide_functionality
