require 'opal-jquery'

def all_projects
  Element.find('#all_projects')
end

def project_table
  Element.find('.project_table')
end

Document.ready? do
  Element.find('#new_assignment').on :click do |click|
    click.prevent_default
    Element.find('.project_table').effect(:hide)
    Element.find('.assignments').effect(:fade_in)
  end
end
