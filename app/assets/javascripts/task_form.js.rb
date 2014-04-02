require 'opal-jquery'

class TaskForm

  def find_new_task
    Element.find('#new_task')
  end

  def find_cancel_task
    Element.find('#cancel_task')
  end

  def fade_in_task_form
    Element.find('.task_form').effect(:fade_in)
  end

  def fade_out_task_form
    Element.find('.task_form').effect(:fade_out)
  end

  def show_task_form
    find_new_task.on :click do |click|
      fade_in_task_form
      click.stop_propagation
    end
  end

  def hide_task_form
    find_cancel_task.on :click do |click|
      click.prevent_default
      fade_out_task_form
      click.stop_propagation
    end
  end

  def show_hide_task_form
    Document.on 'page:change' do
      show_task_form
      hide_task_form
    end
  end
end

tasks = TaskForm.new
tasks.show_hide_task_form
