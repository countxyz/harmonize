module ApplicationHelper

  def full_title(page_title)
    base_title

    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def base_title
    'Harmonize'
  end

  def data_format(data)
    data.nil? || data.empty? ? 'N/A' : data
  end

  def phone_format(phone)
    phone.nil? || phone.empty? ? 'N/A' : number_to_phone(phone, area_code: true)
  end

  def status_format(status)
    if status == true
      'Active'
    else
      'Inactive'
    end
  end

  def inactive_danger_tr(account)
    'danger' unless account.active?
  end

  def non_programmer_format(counter)
    counter + 1
  end

  def logged_in_format(current_user)
    if current_user.admin?
      "Logged in as Admin: #{current_user.handle}"
    else
      "Logged in as User: #{current_user.handle}"
    end
  end

  def icon(icon, text="", html_options={})
    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << " #{text}" unless text.blank?
    html.html_safe
  end

  def task_deadline(deadline = nil)
    deadline.present? ? l(task.deadline, format: :task_list) : 'N/A'
  end
end
