require 'opal-jquery'

class ContactUpdater

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

  def update_contact panel, table, form, close
    Document.on 'page:change' do
      table_to_form panel, table, form
      form_to_table close, table, form
    end
  end
end

contact_forms = ContactUpdater.new

contact_forms.update_contact(
  '#ci-panel', '#ci-table', '#edit-ci-form', '#close-ci')
contact_forms.update_contact(
  '#pb-panel', '#pb-table', '#edit-pb-form', '#close-pb')
contact_forms.update_contact(
  '#sm-panel', '#sm-table', '#edit-sm-form', '#close-sm')
