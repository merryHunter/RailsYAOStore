class Notifier < ActionMailer::Base
  default from: 'chernuhaiv@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
   @order = order

    mail to: order.email, :subject => 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail to: order.email, :subject => "Pragmatic Store Order Shipped"
  end

  def welcome_email(mail)
    @url  = 'http://example.com/login'
    mail(to: mail, subject: 'Welcome to My Awesome Site')
  end
end
