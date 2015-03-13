class StaticPedidosController < ApplicationController

	def lista_pedidos
		@fd_pedidos = FdPedido.where(:fd_mesa_id => params[:fd_mesa_id]).order(:created_at => :desc)
		@fd_mesa_id = params[:fd_mesa_id]
	end		

	def tipo_pedido
			
	end	

	def lista_mesas
		@fd_mesa = FdMesa.where(fd_empresa_id: user.fd_empresa_id).order(:numr_mesa)
	end


	def pedidos

		if params[:fd_pedido_id] == '0'
			@fd_mesa = FdMesa.find(params[:fd_mesa_id])
			@fd_mesa.flag_mesaaberta = false
			@fd_mesa.save

			@fd_pedido = FdPedido.new
			@fd_pedido.fd_mesa_id = @fd_mesa.id
			@fd_pedido.fd_empresa_id = user.fd_empresa_id
			@fd_pedido.fd_situacao_id = 1 #Aberto
			@fd_pedido.save

			@fd_pedido_id = @fd_pedido.id
		else

			@fd_pedido = FdPedido.find(params[:fd_pedido_id])
			@fd_pedido.fd_situacao_id = 1
			@fd_pedido.save
			
			@fd_pedido_id = @fd_pedido.id

			@fd_mesa = @fd_pedido.fd_mesa
		end


	end


	def fecha_pedido
		@fd_pedido = FdPedido.find(params[:fd_pedido_id])
		@fd_pedido.fd_situacao_id = 2
		@fd_pedido.save

		@fd_mesa = FdMesa.find(params[:fd_mesa_id])
		@fd_mesa.flag_mesaaberta = true
		@fd_mesa.save

		redirect_to tipo_pedido_path
	end

end
