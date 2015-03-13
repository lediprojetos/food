class StaticPedidosController < ApplicationController

	def lista_pedidos
			
	end		

	def tipo_pedido
			
	end	

	def lista_mesas
		@fd_mesa = FdMesa.where(fd_empresa_id: user.fd_empresa_id).order(:numr_mesa)
	end


	def pedidos
		@fd_mesa = FdMesa.find(params[:fd_mesa_id])
		@fd_mesa.flag_mesaaberta = false
		@fd_mesa.save

		@fd_pedido = FdPedido.new
		@fd_pedido.fd_mesa_id = @fd_mesa.id
		@fd_pedido.fd_empresa_id = user.fd_empresa_id
		@fd_pedido.fd_empresa_id = 1 #Aberto
		@fd_pedido.save


	end


	def fecha_pedido
		@fd_mesa = FdMesa.find(params[:fd_mesa_id])
		@fd_mesa.flag_mesaaberta = true
		@fd_mesa.save

		redirect_to tipo_pedido_path
	end

end
