class PaymentController < ApplicationController
  def index
  end

	# Checks paycode.
	# Retrieves advisor user based on pay_code
	# if no advisor user exists, redirect to payment path
	# show error Pay Code was invalid.
  def checkpay
    pay_code = params['pay_code']
	
	result = AdvisorUser.where(pay_code: pay_code).take	
	
	if(result == nil) 
		respond_to do |format|
		session[:pay_code_valid] = false
		format.html { redirect_to payment_index_path, notice: 'Pay Code was invalid!' }
		end
	else 
		session[:pay_code_valid]  = true
		session[:pay_code] = pay_code
		redirect_to registration_complete_index_path
		
	end
	
	
    #do your stuff with comments_from_form here
  end
end
