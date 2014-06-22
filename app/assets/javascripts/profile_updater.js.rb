require 'opal-jquery'

class ProfileUpdater

  def table_to_form panel, table, form
    Element.find(panel).on :click do |event|
      event.prevent_default
      Element.find(table).hide
      Element.find(form).effect :slide_down
    end
  end

  def form_to_table close, table, form
    Element.find(close).on :click do |event|    
      event.prevent_default
      Element.find(form).hide
      Element.find(table).effect(:slide_down, 200)
    end
  end

  def update_profile panel, table, form, close
    Document.on 'page:change' do
      table_to_form panel, table, form
      form_to_table close, table, form
    end
  end
end

contact = ProfileUpdater.new

contact.update_profile('#ci-panel', '#ci-table', '#edit-ci-form', '#close-ci')
contact.update_profile('#pb-panel', '#pb-table', '#edit-pb-form', '#close-pb')
contact.update_profile('#sm-panel', '#sm-table', '#edit-sm-form', '#close-sm')

account = ProfileUpdater.new

account.update_profile('#ai-panel', '#ai-table', '#edit-ai-form', '#close-ai')
account.update_profile('#ba-panel', '#ba-table', '#edit-ba-form', '#close-ba')
account.update_profile('#sa-panel', '#sa-table', '#edit-sa-form', '#close-sa')
account.update_profile('#em-panel', '#em-table', '#edit-em-form', '#close-em')
