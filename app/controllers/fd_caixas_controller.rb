class FdCaixasController < ApplicationController
  before_action :set_fd_caixa, only: [:show, :edit, :update, :destroy]

include ActionView::Helpers::NumberHelper

 
 def busca_caixa_aberto
   
   fd_caixa = FdCaixa.where(fd_empresa_id: user.fd_empresa_id, data_fechamento: nil)

   @fd_pedidos = FdPedido.joins(:fd_caixa).where(fd_caixas: {fd_empresa_id: user.fd_empresa_id, data_fechamento: nil})

   if @fd_pedidos
      valor_caixa = @fd_pedidos.sum(:valr_pedido)
   end 

   fd_caixa_json = fd_caixa.map{|item|{:id => item.id, :valor_caixa => number_to_currency(valor_caixa, unit: "R$", separator: ",", delimiter: "")}}
   render :json => fd_caixa_json

 end

 def fechar_caixa

  params[:valor_fechamento] = params[:valor_fechamento].gsub('R$', '')
  params[:valor_fechamento] = params[:valor_fechamento].gsub('.', '')
  params[:valor_fechamento] = params[:valor_fechamento].gsub(',', '.').to_f 

  @fd_caixa = FdCaixa.find(params[:fd_caixa_id])

  @fd_caixa.valor_fechamento = params[:valor_fechamento]
  @fd_caixa.data_fechamento = Time.now
  @fd_caixa.save

  render :json => {}

 end

  # GET /fd_caixas
  def index
    @fd_caixas = FdCaixa.all
  end

  # GET /fd_caixas/1
  def show
  end

  # GET /fd_caixas/new
  def new
    @fd_caixa = FdCaixa.new
  end

  # GET /fd_caixas/1/edit
  def edit
  end

  # POST /fd_caixas
  def create
    @fd_caixa = FdCaixa.new(fd_caixa_params)

    if @fd_caixa.save
      redirect_to @fd_caixa, notice: 'Fd caixa was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_caixas/1
  def update
    if @fd_caixa.update(fd_caixa_params)
      redirect_to @fd_caixa, notice: 'Fd caixa was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_caixas/1
  def destroy
    @fd_caixa.destroy
    redirect_to fd_caixas_url, notice: 'Fd caixa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_caixa
      @fd_caixa = FdCaixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_caixa_params
      params.require(:fd_caixa).permit(:numr_contador, :data_abertura, :data_fechamento, :valor_caixa, :valor_fechamento, :fd_empresa_id)
    end
end
