class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.where(:email => params[:login][:email]).first

		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id
			flash[:notice] = "¡Hola, otra vez! ¡Que gusto verte!"
			redirect_to root_url
		else
			flash[:error] = "Email o Password Incorrectos, trata nuevamente"
			render :new
		end
	end

	def destroy
    	session[:user_id] = nil
    	flash[:notice] = "Nos vemos."

    	redirect_to root_url
  	end
end