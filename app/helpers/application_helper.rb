module ApplicationHelper
  def show_flash_notifications
    notification_js = ''

    flash.each do |t, msg|
      if msg.is_a?(String)
        notification_js << "flashNotification(\"#{msg}\", \"#{t}\");"
      end
    end

    notification_js
  end

  def percentage(val1, val2)
    result = val2.zero? ? 0 : (val1.to_f / val2.to_f) * 100
    number_to_percentage(result, precision: 2)
  end

  def is_admin?
    current_user.is_admin?
  end

  def status_color(status)
    case status
    when 'Cold'
      '#008000'
    when 'Hot'
      '#ff0000'
    when 'Warm'
      '#ffff00'
    end
  end
end
