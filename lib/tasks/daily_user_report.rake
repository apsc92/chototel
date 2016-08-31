require 'csv'
require 'action_view/helpers'
extend ActionView::Helpers
namespace :send do
  desc "Task to send daily user report to admins"
  task :daily_user_report => :environment do
    users = User.all.where.not(role: 'admin').order(name: :asc)
    file_path = "#{Rails.root}/user_report.csv"

    CSV.open(file_path, "wb") do |csv|
      csv << ['List/Rep', 'Hot', 'Warm', 'Cold', 'Potential Order Book', 'Order Confirmed']
      users.each_with_index do |user, index|
        csv << [
                  user.name_displayed,
                  user.meeting_done('Hot'),
                  user.meeting_done('Warm'),
                  user.meeting_done('Cold'),
                  number_to_currency(user.potential_order),
                  number_to_currency(user.orders_confirmed)

                ]
      end
      csv << [
                'Total',
                users.inject(0){ |sum, u| sum + u.meeting_done('Hot') },
                users.inject(0){ |sum, u| sum + u.meeting_done('Warm') },
                users.inject(0){ |sum, u| sum + u.meeting_done('Cold') },
                number_to_currency(users.inject(0){ |sum, u| sum + u.potential_order}),
                number_to_currency(users.inject(0){ |sum, u| sum + u.orders_confirmed})

              ]
    end
    UserMailer.send_report(file_path).deliver_now
  end
end