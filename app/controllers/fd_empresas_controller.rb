class FdEmpresasController < ApplicationController
  before_action :set_fd_empresa, only: [:show, :edit, :update, :destroy]
  before_action :requer_logon

  #requer_logon

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
    @fd_empresa.build_fd_endereco
  end

  # GET /fd_empresas/1/edit
  def edit
    @fd_estado = FdEmpresa.find(params[:id])
    @fd_estado = @fd_estado.fd_endereco.fd_cidade.fd_estado.id

    @fd_cidade = FdCidade.find :all, :conditions => {:fd_estado_id => @fd_estado}

    @fd_cidade_setada = FdEmpresa.find(params[:id])
    @fd_cidade_setada = @fd_cidade_setada.fd_endereco.fd_cidade.id

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
      params.require(:fd_empresa).permit(:desc_razaosocial, :desc_nomefantasia, :nome_responsavel, :desc_cnpj, :desc_telefone, :desc_celular, :data_inclusao, :fd_categoriaempresa_id, fd_endereco_attributes: [ :id, :nome_bairro , :nome_rua, :numr_quadra, :desc_complemento, :desc_pontoreferencia, :numr_cep, :fd_cidade_id])
    end
end
