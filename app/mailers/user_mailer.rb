class UserMailer < ApplicationMailer

default from: 'no-reply@jungle.com'
 
  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Order id: #{order.id} will ship in 1 year!" )
  end

end
