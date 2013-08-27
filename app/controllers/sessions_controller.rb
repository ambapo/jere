class SessionsController < ApplicationController
	def new
	end

	def create
		customer = Customer.find_by_email(params[:session][:email].downcase) 
		if	customer && customer.authenticate(params[:session][:password])
			redirect_to show_url
		else
			flash.now[:error]= 'Invalid email/password combination'
		render 'new'
		end
	end

	def destroy
	end
end
