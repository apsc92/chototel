class UserMailer < ActionMailer::Base
  default from: 'sales@chototel.com'
  def send_report(file_path)
    attachments['user_summary.csv'] = File.read(file_path)
    admin_emails = ['naqisa@chototel.com', 'Rhea@chototel.com', 'joseph.s@chototel.com', 'sameert@joshsoftware.com']
    subject = 'Daily report for ' + Date.today.strftime("%d-%m-%Y")
    mail(to: admin_emails, subject: subject) do |format|
      format.html
    end
    File.delete(file_path)
  end
end