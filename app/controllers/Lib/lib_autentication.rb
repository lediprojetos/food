module Auntentication


	def usuario_logado
		if 	session[:ObjLogon] == nil || session[:ObjLogon] == ""
			return false
		else
			return true
		end
	end

	def requer_logon
		#debugger
		if 	usuario_logado == true
			return true
		else
			redirect_to login_path, notice: 'Fd usuario was successfully created.'
		end
	end	

	def user
		#redirect_to :root if usuario_logado == false
		if usuario_logado == true
			return session[:ObjLogon]
		end
	end

	def encerra_sessao
		reset_session
		redirect_to login_path, notice: 'Fd usuario was successfully created.'
	end

end
