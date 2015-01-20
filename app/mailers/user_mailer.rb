class UserMailer < ActionMailer::Base
  default from: 'oana@up-nxt.com'

  def welcome_email(user)
    @user = user
    @url = 'http://ordersupplies.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to OrderSupplies!')
  end
end
