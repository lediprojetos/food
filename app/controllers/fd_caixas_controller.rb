class FdCaixasController < ApplicationController
  before_action :set_fd_caixa, only: [:show, :edit, :update, :destroy]

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
