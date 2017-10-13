class OrderNotifier < ApplicationMailer
  default from: "no-reply@jungle.com"
  
   def order_email(order)
     @orders = order
     mail(to: @orders.email, subject: "Jungle Order ##{@orders.email}")
   end
end
