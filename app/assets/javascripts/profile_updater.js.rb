require 'opal-jquery'

class ProfileUpdater

  def update_profile(css)
    Document.on 'page:change' do
      table_to_form(css)
      form_to_table(css)
    end
  end

  private

    def table_to_form(css)
      Element.find("##{css}-panel").on :click do |click|
        click.prevent_default
        slide_down_form(css)
      end
    end

    def slide_down_form(css)
      Element.find("##{css}-table").hide
      Element.find("#edit-#{css}-form").effect :slide_down
    end

    def form_to_table(css)
      Element.find("#close-#{css}").on :click do |event|
        event.prevent_default
        slide_up_form(css)
      end
    end

    def slide_up_form(css)
      Element.find("#edit-#{css}-form").hide
      Element.find("##{css}-table").effect(:slide_down, 200)   
    end 
end

click_edit = ProfileUpdater.new
css_ids = ['ai', 'pb', 'em', 'ba', 'sa', 'sm']
css_ids.each { |css_id| click_edit.update_profile(css_id) }
