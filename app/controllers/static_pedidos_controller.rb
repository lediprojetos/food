class StaticPedidosController < ApplicationController

	def tipo_pedido
			
	end	

	def lista_mesas
		@fd_mesa = FdMesa.where(fd_empresa_id: user.fd_empresa_id).order(:numr_mesa)
	end


	def pedidos
		@fd_categoriaproduto = FdCategoriaproduto.where(:father_id => nil)

	end
end
