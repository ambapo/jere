module SessionsHelper

	def sign_in(customer)
		cookies.permanent[:remember_token] = customer.remember_token
		self.current_customer = customer
	end

	def current_customer=(customer)
		@current_customer= customer
	end

	def current_customer
		@current_customer ||= Customer.find_by_remember_token(cookies[:remember_token])
	end

	def signed_in?
		!current_customer.nil?
	end
end
