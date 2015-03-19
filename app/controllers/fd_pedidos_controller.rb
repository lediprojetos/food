
class FdPedidosController < ApplicationController
  before_action :set_fd_pedido, only: [:show, :edit, :update, :destroy]


  def relPedidos
    
  if params[:dataInicio] && params[:dataInicio] != ""
      dateInicio =  params[:dataInicio] #+ ":00+00:00"      
      dateInicio = dateInicio.to_datetime.strftime('%a %b %d %H:%M:%S %Z %Y')
  end
  if params[:dataFim] && params[:dataFim] != ""
     dateFim = params[:dataFim] #+ #  ":00+00:00"
     dateFim = dateFim.to_datetime.strftime('%a %b %d %H:%M:%S %Z %Y')
  end
   
    @fd_itempedidos = FdItempedido.where(created_at: (dateInicio)..dateFim)

    #debugger

    @valor_total =  @fd_itempedidos.sum("valr_item")

   #Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
   # @sivic_relatoriofrequencia = SivicRelatorioscelula.where("data_reuniao >= :data_inicio AND data_reuniao <= :data_fim AND sivic_celula_id = :sivic_celula_id", {data_inicio: dateInicio, data_fim: dateFim, sivic_celula_id:  params[:sivic_celula_id]}).order("data_reuniao")

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
