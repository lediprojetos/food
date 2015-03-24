class StaticPedidosController < ApplicationController

	def lista_pedidos

		if params[:fd_mesa_id] != '0'
			@fd_pedidos = FdPedido.where(:fd_mesa_id => params[:fd_mesa_id]).order(:created_at => :desc).limit(10)
			@fd_mesa_id = params[:fd_mesa_id]
		else
			@fd_pedidos = FdPedido.where(:tipo_atendimento => params[:tipo_atendimento]).order(:created_at => :desc).limit(10)
			@fd_mesa_id = 0
		end

		@tipo_atendimento = params[:tipo_atendimento]
	end		

	def tipo_pedido
			
	end	

	def lista_mesas
		@fd_mesa = FdMesa.where(fd_empresa_id: user.fd_empresa_id).order(:numr_mesa)
	end


	def pedidos

		if params[:fd_pedido_id] == '0'

			@fd_pedido = FdPedido.new

			if params[:fd_mesa_id] != '0'
				@fd_mesa = FdMesa.find(params[:fd_mesa_id])
				@fd_mesa.flag_mesaaberta = false
				@fd_mesa.save
				@fd_pedido.fd_mesa_id = @fd_mesa.id
			end

			@fd_pedido.tipo_atendimento = params[:tipo_atendimento]
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

			@fd_cliente_id = @fd_pedido.fd_cliente_id
		end


	end


	def fecha_pedido
		@fd_pedido = FdPedido.find(params[:fd_pedido_id])
		@fd_pedido.fd_situacao_id = 2
		@fd_pedido.save

		fd_pedido = FdPedido.where(:fd_empresa_id => user.fd_empresa_id, :fd_mesa_id => params[:fd_mesa_id], :fd_situacao_id => 1)

		if fd_pedido.blank?

			if params[:fd_mesa_id] != '0'
				@fd_mesa = FdMesa.find(params[:fd_mesa_id])
				@fd_mesa.flag_mesaaberta = true
				@fd_mesa.save
			end

		end

		redirect_to root_path
	end


	def lista_pedidos_geral
		@fd_itempedido = FdItempedido.where(fd_empresa_id: user.fd_empresa_id)
	end

end
