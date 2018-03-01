class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation(order)
    @order = order

    mail(to: @order.email,
      subject: 'Confirmation of order number #{@order.id}.')
  end
end