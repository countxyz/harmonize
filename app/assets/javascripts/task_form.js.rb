require 'opal-jquery'

class TaskForm

  def new_task
    Element.find('#new_task')
  end

  def edit_task
    Element.find('ul#task_list #new_task_form')
  end

  def cancel_task
    Element.find('#cancel_task')
  end

  def fade_in_new_task_form
    Element.find('#new_task_form').effect(:fade_in)
  end

  def fade_out_new_task_form
    Element.find('#new_task_form').effect(:fade_out)
  end

  def show_task_form_new
    new_task.on :click do |click|
      fade_in_new_task_form
      click.stop_propagation
    end
  end

  def show_task_form_edit
    edit_task.on :click do |click|
      click.prevent_default
      fade_in_new_task_form
      click.stop_propagation
    end
  end

  def hide_task_form_new
    cancel_task.on :click do |click|
      click.prevent_default
      fade_out_new_task_form
      click.stop_propagation
    end
  end

  def show_hide_task_form_new
    Document.on 'page:change' do
      show_task_form_new
      hide_task_form_new
    end
  end
end

tasks = TaskForm.new
tasks.show_hide_task_form_new
tasks.show_task_form_edit
