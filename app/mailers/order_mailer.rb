class OrderMailer < ActionMailer::Base
	def send_for_review_email(user, order, current_user)
		@user = user
		@order = order
		mail(to: @user.email, from: current_user.email, subject: 'Review the next order')
	end

	# def send_final_order_email(user, order, current_user)
	# 	@user = user
	# 	@order = order
	# 	mail(to: @user.email, from: current_user.email, subject: 'Order for UP-nxt')
	# end
end