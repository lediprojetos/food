class FdEntregasController < ApplicationController
  before_action :set_fd_entrega, only: [:show, :edit, :update, :destroy]


  def insere_entrega

    params[:valr_entrega] = params[:valr_entrega].gsub('R$', '')
    params[:valr_entrega] = params[:valr_entrega].gsub('.', '')
    params[:valr_entrega] = params[:valr_entrega].gsub(',', '.').to_f      

    fd_entrega = FdEntrega.find_by_fd_pedido_id(params[:fd_pedido_id])

    if fd_entrega.blank?
      fd_entrega = FdEntrega.new
      fd_entrega.fd_pedido_id = params[:fd_pedido_id]
      fd_entrega.valr_entrega = params[:valr_entrega]
      fd_entrega.save
    else
      fd_entrega.valr_entrega = params[:valr_entrega]
      fd_entrega.save
    end

    render :json => {}

  end

  # GET /fd_entregas
  def index
    @fd_entregas = FdEntrega.all
  end

  # GET /fd_entregas/1
  def show
  end

  # GET /fd_entregas/new
  def new
    @fd_entrega = FdEntrega.new
  end

  # GET /fd_entregas/1/edit
  def edit
  end

  # POST /fd_entregas
  def create
    @fd_entrega = FdEntrega.new(fd_entrega_params)

    if @fd_entrega.save
      redirect_to @fd_entrega, notice: 'Fd entrega was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_entregas/1
  def update
    if @fd_entrega.update(fd_entrega_params)
      redirect_to @fd_entrega, notice: 'Fd entrega was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_entregas/1
  def destroy
    @fd_entrega.destroy
    redirect_to fd_entregas_url, notice: 'Fd entrega was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_entrega
      @fd_entrega = FdEntrega.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_entrega_params
      params.require(:fd_entrega).permit(:fd_pedido_id, :valr_entrega)
    end
end
