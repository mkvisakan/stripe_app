class AccountController < ApplicationController

	def index
		 @user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to :action => "index", :id => @user.id
    else
      render 'new'
    end

	end

	def signup
		@user = User.new
	end
	
	def signin
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.password == params[:password]
			redirect_to :action => "index", :id => @user.id
		else
			redirect_to :back
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_no)
		end

	
end
