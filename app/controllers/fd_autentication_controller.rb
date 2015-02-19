class FdAutenticationController < ApplicationController

	def login
		desc_login = params[:desc_login]
		desc_senha = params[:desc_senha]

		#session[:ObjLogon] = FdUsuario.where(:desc_login => desc_login, :desc_senha => desc_senha) rescue nil
		session[:ObjLogon] = FdUsuario.where(:desc_login => desc_login, :desc_senha => desc_senha) rescue nil
		session[:ObjLogon] = session[:ObjLogon].first

		if usuario_logado == true
			redirect_to root_path, notice: 'Usuario logado com sucesso.'
		end
		
	end

	def logoff
		encerra_sessao
	end

end
