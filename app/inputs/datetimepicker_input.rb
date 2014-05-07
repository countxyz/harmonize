class DatetimepickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:type] = 'text'
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ class: 'form-control' })

    template.content_tag :div, class: 'input-group date datetimepicker10',
      'data-date-format' => 'lll' do
      input = super
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :span, '', class: 'fa fa-calendar'
      end
      input
    end
  end
end
