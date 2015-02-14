class FdEmpresasController < ApplicationController
  before_action :set_fd_empresa, only: [:show, :edit, :update, :destroy]

  # GET /fd_empresas
  def index
    @fd_empresas = FdEmpresa.all
  end

  # GET /fd_empresas/1
  def show
  end

  # GET /fd_empresas/new
  def new
    @fd_empresa = FdEmpresa.new
  end

  # GET /fd_empresas/1/edit
  def edit
  end

  # POST /fd_empresas
  def create
    @fd_empresa = FdEmpresa.new(fd_empresa_params)

    if @fd_empresa.save
      redirect_to @fd_empresa, notice: 'Fd empresa was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_empresas/1
  def update
    if @fd_empresa.update(fd_empresa_params)
      redirect_to @fd_empresa, notice: 'Fd empresa was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_empresas/1
  def destroy
    @fd_empresa.destroy
    redirect_to fd_empresas_url, notice: 'Fd empresa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_empresa
      @fd_empresa = FdEmpresa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_empresa_params
      params.require(:fd_empresa).permit(:desc_razaosocial, :desc_nomefantasia, :nome_responsavel, :desc_cnpj, :desc_telefone, :desc_celular, :data_inclusao, :fd_endereco_id, :fd_categoriaempresa_id)
    end
end
