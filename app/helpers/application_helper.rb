module ApplicationHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'danger' if type == 'alert' || type == 'error'
      
      text = content_tag(:div, message, class: "alert alert-#{type} alert-dismissible fade show", role: 'alert') do
        concat message
        concat button_tag('×', type: 'button', class: 'btn-close', data: { bs_dismiss: 'alert' }, aria: { label: 'Close' })
      end
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
end
