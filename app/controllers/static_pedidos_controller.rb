#encoding: utf-8
class StaticPedidosController < ApplicationController

	def lista_pedidos

		if params[:fd_mesa_id] != '0'
			#@fd_pedidos = FdPedido.where(:fd_mesa_id => params[:fd_mesa_id]).order(:created_at => :desc).limit(10)
			@fd_pedidos = FdPedido.joins(:fd_caixa).where(:fd_mesa_id => params[:fd_mesa_id], fd_caixas: { data_fechamento: nil}) rescue nil 
    
			@fd_mesa_id = params[:fd_mesa_id]
		else
			#@fd_pedidos = FdPedido.where(:tipo_atendimento => params[:tipo_atendimento]).order(:created_at => :desc).limit(10)
			@fd_pedidos = FdPedido.joins(:fd_caixa).where(:tipo_atendimento => params[:tipo_atendimento], :fd_empresa_id => user.fd_empresa_id, fd_caixas: { data_fechamento: nil}) rescue nil 
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


       @fd_caixa = FdCaixa.where(fd_empresa_id: user.fd_empresa_id, data_fechamento: nil).order(:data_abertura => :desc).limit(1)
       
      
       @fd_caixa.first.numr_contador = @fd_caixa.first.numr_contador + 1
      
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
			@fd_pedido.numr_contador = @fd_caixa.first.numr_contador
			@fd_pedido.fd_caixa_id =  @fd_caixa.first.id
			@fd_pedido.fd_situacao_id = 1 #Aberto
			@fd_pedido.save

			@fd_caixa.first.save

			@fd_pedido_id = @fd_pedido.id
			@numr_contador = @fd_pedido.numr_contador
			
		else
			@fd_pedido = FdPedido.find(params[:fd_pedido_id])
			@fd_pedido.fd_situacao_id = 1
			@fd_pedido.save
			
			@fd_pedido_id = @fd_pedido.id
			@numr_contador = @fd_pedido.numr_contador

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
  		@fd_categoriaproduto = FdCategoriaproduto.where(fd_empresa_id: user.fd_empresa_id)
  end

def busca_pedidos_geral

	play_sound = false

	if params[:situacao] == "" 
	 params[:situacao] = 0
	end

	if  params[:categoria_produto] == ""
		params[:categoria_produto] = "0"
		  params[:categoria_produto] = params[:categoria_produto].split(",").map(&:to_i) 

	else
      	params[:categoria_produto] = params[:categoria_produto].split(",").map(&:to_i) 
 
	end

   	fd_pedido = FdItempedido.joins('INNER JOIN fd_variacaoprodutos vp on fd_variacaoproduto_id = vp.id 
   	                               	INNER JOIN fd_produtos pr on vp.fd_produto_id = pr.id
   	                               	INNER JOIN fd_pedidos pd on fd_pedido_id = pd.id
   	                               	INNER JOIN fd_caixas ca on pd.fd_caixa_id = ca.id 
   	                               ').where('pr.fd_categoriaproduto_id in (?) and fd_itempedidos.fd_situacao_id = ? and data_fechamento is null', params[:categoria_produto], params[:situacao]).order('created_at DESC') rescue nil
  
    fd_pedido.each do |fd_pedido|


    	if fd_pedido.flag_exibido != true

    		fditempedido = FdItempedido.find(fd_pedido.id)
    		fditempedido.flag_exibido = true 
    		fditempedido.save

    		play_sound = true
		end

      
    	fd_pedido.desc_pedido = fd_pedido.fd_variacaoproduto.fd_produto.nome_produto

		if fd_pedido.flag_pedidomisto
			misto = FdPedidomisto.where(fd_itempedidos_id: fd_pedido.id) 	    
			fd_pedido.desc_pedido = ""
			misto.each do |m|    	
	 			fd_pedido.desc_pedido = fd_pedido.desc_pedido + ' ½ ' + m.fd_produto.nome_produto
			end
		end
    
		fd_pedido.desc_ingredientemenos = ""
		fd_pedido.desc_ingredientemais = ""
		if fd_pedido.flag_itemalterado
			if fd_pedido.flag_pedidomisto
				misto.each do |m|
					item_alterado = FdItemalterado.where(fd_pedidomisto_id: m.id)
					item_alterado.each do |alterado| 
						if alterado.numr_quntidade < 1   	
			 				fd_pedido.desc_ingredientemenos = fd_pedido.desc_ingredientemenos + ' ' + alterado.fd_item.desc_item + ', '
		   				end
		 			end					

				end
			else
				item_alterado = FdItemalterado.where(fd_itempedido_id: fd_pedido.id) 	    
				item_alterado.each do |alterado| 
					if alterado.numr_quntidade < 1   	
		 				fd_pedido.desc_ingredientemenos = fd_pedido.desc_ingredientemenos + ' ' + alterado.fd_item.desc_item + ', '
	   				end
	 			end
			end
		end
   
   		fd_pedido.desc_itemadicional = ""
	   if fd_pedido.flag_itemadicional
	      item_adicional = FdAdicionaisincluso.where(fd_itempedido_id: fd_pedido.id)
	    
	      item_adicional.each do |add|
	       if add.numr_quantidade > 0        
	       		fd_pedido.desc_itemadicional = fd_pedido.desc_itemadicional + ' ' + add.fd_itensadicional.fd_item.desc_item + ', '
	       end
	      end
	   end
	end


	fd_pedido_json = fd_pedido.map{|item|{:id => item.id, 
											:nome_produto => item.desc_pedido, 
											:situacao => item.fd_situacao.nome_situacao, 
											:tipo_atendimento => item.tipo_atendimento, 
											:tamanho => item.desc_variaco, 
											:itemmais => item.desc_itemadicional,
											:itemmenos => item.desc_ingredientemenos,
											:obs => (item.desc_observacao.nil? ? "" : "♣ " + item.desc_observacao),
											:numr_contador => item.fd_pedido.numr_contador, 
											:play_sound => play_sound,
											:mesa => (item.fd_pedido.fd_mesa.numr_mesa rescue nil) }}  	
	render :json => fd_pedido_json   
   
end


 def muda_sitaucao_pedido

    @fd_pedido = FdItempedido.find(params[:fd_itempedido])

    if @fd_pedido.fd_situacao_id == 1
       @fd_pedido.fd_situacao_id = 2
    elsif @fd_pedido.fd_situacao_id == 2		
      @fd_pedido.fd_situacao_id = 3
    end

   @fd_pedido.save
   
   busca_pedidos_geral

  end

end
