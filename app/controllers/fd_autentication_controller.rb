class FdAutenticationController < ApplicationController

	def login
		desc_login = params[:desc_login]
		desc_senha = params[:desc_senha]

		#session[:ObjLogon] = FdUsuario.where(:desc_login => desc_login, :desc_senha => desc_senha) rescue nil
		session[:ObjLogon] = FdUsuario.where(:desc_login => desc_login, :desc_senha => desc_senha) rescue nil


		#debugger

	end

end
