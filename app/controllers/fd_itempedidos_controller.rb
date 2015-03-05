class FdItempedidosController < ApplicationController
  before_action :set_fd_itempedido, only: [:show, :edit, :update, :destroy]

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

  def busca_itempedido


    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id]).order(:fd_variacaoproduto_id)
    #qtd = fd_itenspedidos.group(:fd_variacaoproduto_id).count


    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :desc_produto => item.fd_variacaoproduto.fd_produto.nome_produto, :desc_variacao => item.fd_variacaoproduto.fd_variacao.desc_variacao, :fd_pedido_id => item.fd_pedido_id, :fd_status_id => item.fd_status_id, :fd_funcionario_id => item.fd_funcionario_id}}
    render :json => fd_itenspedidos_json

  end

  def exclui_itempedido

    fd_itenspedidos = FdItempedido.find(params[:id])
    fd_itenspedidos.destroy
    #fd_itenspedidos = FdItempedido.find(params[:id]) rescue nil

    #debugger

    #fd_itenspedidos_json = fd_itenspedidos.map {|item| {:id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :desc_produto => item.fd_variacaoproduto.fd_produto.nome_produto, :desc_variacao => item.fd_variacaoproduto.fd_variacao.desc_variacao, :fd_pedido_id => item.fd_pedido_id, :fd_status_id => item.fd_status_id, :fd_funcionario_id => item.fd_funcionario_id}}
    render json: {}, status: :no_content

  end   

  def dobra_itempedido

    fd_itenspedidos = FdItempedido.find(params[:fd_itempedido_id])
    fd_itemdobrado = FdItempedido.new

    fd_itemdobrado.desc_observacao = fd_itenspedidos.desc_observacao
    fd_itemdobrado.valr_item = fd_itenspedidos.valr_item 
    fd_itemdobrado.tipo_atendimento = fd_itenspedidos.tipo_atendimento
    fd_itemdobrado.fd_empresa_id = fd_itenspedidos.fd_empresa_id
    fd_itemdobrado.fd_variacaoproduto_id = fd_itenspedidos.fd_variacaoproduto_id
    fd_itemdobrado.fd_pedido_id = fd_itenspedidos.fd_pedido_id
    fd_itemdobrado.fd_status_id = fd_itenspedidos.fd_status_id
    fd_itemdobrado.fd_funcionario_id = fd_itenspedidos.fd_funcionario_id
    fd_itemdobrado.save

    fd_itenspedidos = FdItempedido.where(:id => fd_itemdobrado.id)

    #debugger

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :fd_pedido_id => item.fd_pedido_id, :fd_status_id => item.fd_status_id, :fd_funcionario_id => item.fd_funcionario_id}}
    render :json => fd_itenspedidos_json

  end  

  def insere_itempedido

    fd_itenspedidos = FdItempedido.new
    fd_itenspedidos.desc_observacao = params[:FdItempedido]
    fd_itenspedidos.valr_item = params[:valr_item]
    fd_itenspedidos.tipo_atendimento = params[:tipo_atendimento]
    fd_itenspedidos.fd_empresa_id = user.fd_empresa_id
    fd_itenspedidos.fd_variacaoproduto_id = params[:fd_variacaoproduto_id]
    fd_itenspedidos.fd_pedido_id = params[:fd_pedido_id]
    fd_itenspedidos.fd_status_id = params[:fd_status_id]
    fd_itenspedidos.fd_funcionario_id = params[:fd_funcionario_id]
    fd_itenspedidos.save

    fd_itenspedidos = FdItempedido.where(:fd_pedido_id => params[:fd_pedido_id])

    #debugger

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :fd_pedido_id => item.fd_pedido_id, :fd_status_id => item.fd_status_id, :fd_funcionario_id => item.fd_funcionario_id}}
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
