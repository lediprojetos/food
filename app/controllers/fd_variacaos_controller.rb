class FdVariacaosController < ApplicationController
  before_action :set_fd_variacao, only: [:show, :edit, :update, :destroy]

  # GET /fd_variacaos
  def index
    @fd_variacaos = FdVariacao.where('id <> ' + $Unico.to_s + ' and fd_empresa_id = ' + user.fd_empresa_id.to_s)
  end

  # GET /fd_variacaos/1
  def show
  end

  # GET /fd_variacaos/new
  def new
    @fd_variacao = FdVariacao.new
  end

  # GET /fd_variacaos/1/edit
  def edit
  end

  # POST /fd_variacaos
  def create
    @fd_variacao = FdVariacao.new(fd_variacao_params)

    if @fd_variacao.save
      redirect_to @fd_variacao, notice: 'Fd variacao was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_variacaos/1
  def update
    if @fd_variacao.update(fd_variacao_params)
      redirect_to @fd_variacao, notice: 'Fd variacao was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_variacaos/1
  def destroy
    @fd_variacao.destroy
    redirect_to fd_variacaos_url, notice: 'Fd variacao was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_variacao
      @fd_variacao = FdVariacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_variacao_params
      params.require(:fd_variacao).permit(:desc_variacao, :fd_empresa_id)
    end
end
