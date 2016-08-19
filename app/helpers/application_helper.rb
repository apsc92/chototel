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
end
