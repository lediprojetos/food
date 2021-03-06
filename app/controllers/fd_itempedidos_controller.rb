#encoding: utf-8
class FdItempedidosController < ApplicationController
  before_action :set_fd_itempedido, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

  def salva_observacao

    fd_itenspedidos = FdItempedido.find(params[:fd_itempedido_id])

    fd_itenspedidos.desc_observacao = params[:desc_observacao]
    fd_itenspedidos.save

    render json: {}, status: :no_content    

  end

  def exclui_servicopedido

    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id], :fd_variacaoproduto_id => params[:fd_variacaoproduto_id])

    if not fd_itenspedidos.blank?
    fd_itenspedidos.first.destroy
    end

    render json: {}, status: :no_content
  end  

  # GET /fd_itempedidos
  def index
    @fd_itempedidos = FdItempedido.all
  end

  # GET /fd_itempedidos/1
  def show
  end

  # GET /fd_itempedidos/new
  def new
    @fd_itempedido = FdItempedido.new
  end

  # GET /fd_itempedidos/1/edit
  def edit
  end

  # POST /fd_itempedidos
  def create
    @fd_itempedido = FdItempedido.new(fd_itempedido_params)

    if @fd_itempedido.save
      redirect_to @fd_itempedido, notice: 'Fd itempedido was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_itempedidos/1
  def update
    if @fd_itempedido.update(fd_itempedido_params)
      redirect_to @fd_itempedido, notice: 'Fd itempedido was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_itempedidos/1
  def destroy
    @fd_itempedido.destroy
    redirect_to fd_itempedidos_url, notice: 'Fd itempedido was successfully destroyed.'
  end

  def busca_itemcomanda_adicionais

    fd_adicionais = FdAdicionaisincluso.joins('inner join fd_itempedidos ip on ip.id = fd_itempedido_id inner join fd_itensadicionals ia on fd_itensadicional_id = ia.id').where('ip.fd_pedido_id = ?', params[:fd_pedido_id])

    fd_adicionais_json = fd_adicionais.map {|item| {:fd_adicionaisinclusos_id => item.id,
                                                    :desc_produto => item.fd_itensadicional.fd_item.desc_item,
                                                    :numr_quantidade => item.numr_quantidade,
                                                    :valr_item => number_to_currency((item.fd_itensadicional.valr_item * item.numr_quantidade), unit: "R$", separator: ",", delimiter: ".")}}

    render :json => fd_adicionais_json

end

  def busca_itemcomanda

    fd_entrega = FdEntrega.find_by_fd_pedido_id(params[:fd_pedido_id])

    valr_entrega = (fd_entrega.valr_entrega rescue 0)

    @total_pedido = 0

    fd_adicionais = FdAdicionaisincluso.joins('inner join fd_itempedidos ip on ip.id = fd_itempedido_id inner join fd_itensadicionals ia on fd_itensadicional_id = ia.id').where('ip.fd_pedido_id = ?', params[:fd_pedido_id])    

    fd_adicionais.each do |ad|

      @total_pedido = (@total_pedido + ad.fd_itensadicional.valr_item) * ad.numr_quantidade.to_i

    end

    fd_pedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id])
    porcentagem = 0

    fd_pedidos.each do |p|

      if not p.flag_pedidomisto == true
        if not p.fd_variacaoproduto.fd_produto.numr_porcentagem.blank?
          porcentagem =  porcentagem + p.fd_variacaoproduto.fd_produto.numr_porcentagem
        end
      end

    end

    @total_pedido = (@total_pedido + FdItempedido.sum(:valr_item, :conditions => {:fd_pedido_id => params[:fd_pedido_id]}) + valr_entrega)

    @totalgeral_pedido = @total_pedido + (@total_pedido / 100) * porcentagem

    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id]).order(:id)

    fd_pedido = FdPedido.find(params[:fd_pedido_id])

    if fd_pedido.valr_pedido.blank? 
      fd_pedido.valr_pedido = 0
    end

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:tipo_atendimento => item.tipo_atendimento,
                                                        :id => item.id, 
                                                        :flag_pedidomisto => item.flag_pedidomisto, 
                                                        :valr_item => (item.valr_item.blank? ? (item.fd_variacaoproduto.fd_produto.numr_porcentagem.to_s + '%') : (number_to_currency( item.valr_item, unit: "R$", separator: ",", delimiter: "."))),
                                                        :desc_produto => (item.fd_variacaoproduto.fd_produto.nome_produto rescue ''), 
                                                        :desc_variacao => (item.fd_variacaoproduto.fd_variacao.desc_variacao == 'Único' ? '' : item.fd_variacaoproduto.fd_variacao.desc_variacao rescue ''), 
                                                        :desc_variacaoMisto => (item.desc_variacaoMisto == 'Único' ? '' : item.desc_variacaoMisto rescue ''), 
                                                        :valr_item_total =>number_to_currency(@total_pedido, unit: "", separator: ",", delimiter: "."), 
                                                        :valr_item_total_geral =>number_to_currency(@totalgeral_pedido, unit: "", separator: ",", delimiter: "."), 
                                                        :valr_pedido => number_to_currency(fd_pedido.valr_pedido, unit: "", separator: ",", delimiter: "."), 
                                                        :fd_funcionario_id => item.fd_funcionario_id,
                                                        :valr_entrega =>number_to_currency(valr_entrega, unit: "R$", separator: ",", delimiter: ".")}}
    render :json => fd_itenspedidos_json

end

  def busca_itempedido  

    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id]).order(:id)

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:tipo_atendimento => item.tipo_atendimento, 
                                                        :id => item.id,
                                                        :flag_pedidomisto => item.flag_pedidomisto, 
                                                        :fd_categoriaproduto_id =>  (item.fd_variacaoproduto.fd_produto.fd_categoriaproduto_id rescue nil), 
                                                        :desc_observacao => item.desc_observacao, 
                                                        :valr_item => (item.valr_item.blank? ? (item.fd_variacaoproduto.fd_produto.numr_porcentagem.to_s + '%') : (number_to_currency( item.valr_item, unit: "R$", separator: ",", delimiter: "."))),
                                                        :tipo_atendimento => item.tipo_atendimento, 
                                                        :fd_empresa_id => item.fd_empresa_id, 
                                                        :fd_variacaoproduto_id => item.fd_variacaoproduto_id,
                                                        :fd_produto_id => (item.fd_variacaoproduto.fd_produto_id rescue nil), 
                                                        :desc_produto => (item.fd_variacaoproduto.fd_produto.nome_produto rescue nil), 
                                                        :desc_variacao => (item.fd_variacaoproduto.fd_variacao.desc_variacao == 'Único' ? '' : item.fd_variacaoproduto.fd_variacao.desc_variacao rescue ''), 
                                                        :desc_variacaoMisto => (item.desc_variacaoMisto == 'Único' ? '' : item.desc_variacaoMisto rescue ''), 
                                                        :fd_pedido_id => item.fd_pedido_id, 
                                                        :fd_situacao_id => item.fd_situacao_id, 
                                                        :fd_funcionario_id => item.fd_funcionario_id}}
    render :json => fd_itenspedidos_json

  end

  def atualiza_tipoatendimento

    fd_itenspedidos = FdItempedido.find(params[:fd_itempedido_id])
    fd_itenspedidos.tipo_atendimento = params[:tipo_atendimento]
    fd_itenspedidos.save

    render json: {}, status: :no_content

  end  

  def exclui_itempedido

    FdPedidocombo.destroy_all(:fd_itempedidos_id => params[:id])
    FdPedidomisto.destroy_all(:fd_itempedidos_id => params[:id])

    fd_itenspedidos = FdItempedido.find(params[:id])
    fd_itenspedidos.destroy

    render json: {}, status: :no_content
  end

  def insere_pedidomisto

    fd_pedido = FdPedido.find(params[:fd_pedido_id])


    fd_variacaoproduto = FdVariacaoproduto.find(params[:fd_variacaoproduto_id])
    fd_variacaoproduto2 = FdVariacaoproduto.find(params[:fd_variacaoproduto_id2])

    if fd_variacaoproduto.valr_produto > fd_variacaoproduto2.valr_produto

      fd_variacaoproduto_maior = fd_variacaoproduto
      fd_variacaoproduto_menor = fd_variacaoproduto2

    else

      fd_variacaoproduto_maior = fd_variacaoproduto2
      fd_variacaoproduto_menor = fd_variacaoproduto      

    end



    fd_itenspedidos = FdItempedido.new
    fd_itenspedidos.fd_empresa_id = user.fd_empresa_id
    fd_itenspedidos.valr_item = fd_variacaoproduto_maior.valr_produto
    fd_itenspedidos.fd_variacaoproduto_id = fd_variacaoproduto_maior.id
    fd_itenspedidos.fd_pedido_id = params[:fd_pedido_id]
    fd_itenspedidos.flag_pedidomisto = true
    fd_itenspedidos.fd_situacao_id = 1
    fd_itenspedidos.tipo_atendimento = fd_pedido.tipo_atendimento
    fd_itenspedidos.save

    fd_pedidomisto = FdPedidomisto.new
    fd_pedidomisto.fd_itempedidos_id = fd_itenspedidos.id
    fd_pedidomisto.fd_produto_id = fd_variacaoproduto_maior.fd_produto_id
    fd_pedidomisto.fd_variacaoproduto_id = fd_variacaoproduto_maior.id
    fd_pedidomisto.save    

    fd_pedidomisto = FdPedidomisto.new
    fd_pedidomisto.fd_itempedidos_id = fd_itenspedidos.id
    fd_pedidomisto.fd_produto_id = fd_variacaoproduto_menor.fd_produto_id
    fd_pedidomisto.fd_variacaoproduto_id = fd_variacaoproduto_menor.id
    fd_pedidomisto.save

    render json: {}
  end  

  def insere_itempedido

    fd_pedido = FdPedido.find(params[:fd_pedido_id])

    objFdVariacaoproduto = FdVariacaoproduto.find(params[:fd_variacaoproduto_id])

    fd_itenspedidos = FdItempedido.new
    fd_itenspedidos.desc_observacao = params[:desc_observacao]
    fd_itenspedidos.valr_item = objFdVariacaoproduto.valr_produto
    fd_itenspedidos.tipo_atendimento = params[:tipo_atendimento]
    fd_itenspedidos.fd_empresa_id = user.fd_empresa_id
    fd_itenspedidos.fd_variacaoproduto_id = params[:fd_variacaoproduto_id]
    fd_itenspedidos.fd_pedido_id = params[:fd_pedido_id]
    fd_itenspedidos.fd_situacao_id = params[:fd_situacao_id]
    fd_itenspedidos.fd_funcionario_id = params[:fd_funcionario_id]
    fd_itenspedidos.tipo_atendimento = fd_pedido.tipo_atendimento
    fd_itenspedidos.save

    if objFdVariacaoproduto.fd_produto.fd_categoriaproduto_id == $Combos

      fd_produtoscombo = FdProdutocombo.where(:fd_produto_id => objFdVariacaoproduto.fd_produto_id)

      if not fd_produtoscombo.blank?
        fd_produtoscombo.map do |t|

          #debugger
          obj = FdPedidocombo.new
          obj.fd_itempedidos_id = fd_itenspedidos.id
          obj.fd_produtos_id = t.fd_produto_combo
          obj.save
          #(fd_itenspedidos.id, t.fd_produto_combo)
          
        end
      end


    end

    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id])

    #debugger

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :fd_pedido_id => item.fd_pedido_id, :fd_situacao_id => item.fd_situacao_id, :fd_funcionario_id => item.fd_funcionario_id}}
    render :json => fd_itenspedidos_json

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_itempedido
      @fd_itempedido = FdItempedido.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_itempedido_params
      params.require(:fd_itempedido).permit(:desc_observacao, :valr_item, :tipo_atendimento, :fd_empresa_id, :fd_variacaoproduto_id, :fd_pedido_id, :fd_status_id, :fd_funcionario_id)
    end
end
