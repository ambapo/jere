class CustomersController < ApplicationController
  def new
  	@customer = Customer.new
  end

  def create 
  	@customer = Customer.new(params[:customer])
  	if @customer.save
  		flash[:success] = "Welcome to Queens community"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
