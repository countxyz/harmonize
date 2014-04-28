require 'opal-jquery'

class ProjectProfile
  def find_new_assignment
    Element.find '#new_assignment'
  end

  def hide_project_profile
    Element.find('.project_profile').hide
  end

  def assignment_form_slide
    Element.find('#assignment-form').effect :slide_down
  end

  def click_new_assignment
    find_new_assignment.on :click do |event|
      hide_project_profile
      assignment_form_slide
      event.stop_propagation
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
