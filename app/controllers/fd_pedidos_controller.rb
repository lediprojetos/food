class FdPedidosController < ApplicationController
  before_action :set_fd_pedido, only: [:show, :edit, :update, :destroy]


  def relPedidos
    @fd_itempedidos = FdItempedido.all
    @valor_total =  @fd_itempedidos.sum("valr_item")
  end


  # GET /fd_pedidos
  def index
    @fd_pedidos = FdPedido.all
  end

  # GET /fd_pedidos/1
  def show
  end

  # GET /fd_pedidos/new
  def new
    @fd_pedido = FdPedido.new
  end

  # GET /fd_pedidos/1/edit
  def edit
  end

  # POST /fd_pedidos
  def create
    @fd_pedido = FdPedido.new(fd_pedido_params)

    if @fd_pedido.save
      redirect_to @fd_pedido, notice: 'Fd pedido was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_pedidos/1
  def update
    if @fd_pedido.update(fd_pedido_params)
      redirect_to @fd_pedido, notice: 'Fd pedido was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_pedidos/1
  def destroy
    @fd_pedido.destroy
    redirect_to fd_pedidos_url, notice: 'Fd pedido was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_pedido
      @fd_pedido = FdPedido.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_pedido_params
      params.require(:fd_pedido).permit(:valr_pedido, :flag_pago, :fd_empresa_id, :fd_cliente_id, :fd_mesa_id, :fd_funcionario_id, :fd_formapagamento_id, :fd_status_id)
    end
end
