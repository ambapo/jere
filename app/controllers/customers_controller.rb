class CustomersController < ApplicationController

  before_filter :signed_in_customer, only: [:edit, :update]
  before_filter :correct_customer, only: [:edit, :update]
  def new
  	@customer = Customer.new
  end

  def create 
  	@customer = Customer.new(params[:customer])
  	if @customer.save
      sign_in @customer
  		flash[:success] = "Welcome to Queens community"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update 
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:success]= "Your profile has been updated"
      sign_in @cuctomer
      redirect_to @customer
    else
      render 'edit'
    end 
  end
private

def signed_in_customer
  redirect_to signin_url, notice: "Please sign in first." unless signed_in?
  end 

  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to(root_url) unless current_customer?(@customer)
  end

end
