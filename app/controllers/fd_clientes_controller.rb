#encoding: utf-8
class FdClientesController < ApplicationController
  before_action :set_fd_cliente, only: [:show, :edit, :update, :destroy]

  # GET /fd_clientes
  def index
    @fd_clientes = FdCliente.where(fd_empresa_id: user.fd_empresa_id)
  end

  # GET /fd_clientes/1
  def show
  end

  # GET /fd_clientes/new
  def new
    @fd_cliente = FdCliente.new
  
    @fd_cliente.build_fd_endereco 
  end

  # GET /fd_clientes/1/edit
  def edit
    @fd_estado = FdCliente.find(params[:id])
    @fd_estado = @fd_estado.fd_endereco.fd_cidade.fd_estado.id

    @fd_cidade = FdCidade.find :all, :conditions => {:fd_estado_id => @fd_estado}

  end

  # POST /fd_clientes
  def create
    @fd_cliente = FdCliente.new(fd_cliente_params)
    @fd_cliente.data_inclusao = Time.now

    if @fd_cliente.save
      redirect_to @fd_cliente, notice: 'Registro inserido com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_clientes/1
  def update
    if @fd_cliente.update(fd_cliente_params)
      redirect_to @fd_cliente, notice: 'Registro alterado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_clientes/1
  def destroy
    @fd_cliente.destroy
    redirect_to fd_clientes_url, notice: 'Registro excluído com sucesso..'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_cliente
      @fd_cliente = FdCliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_cliente_params
      params.require(:fd_cliente).permit(:nome_cliente, :desc_sexo, :desc_celular, :desc_telefone, :desc_email, :desc_cpf, :data_nascimento, :data_inclusao, :fd_empresa_id, fd_endereco_attributes: [ :id, :nome_bairro , :nome_rua, :numr_quadra, :desc_complemento, :desc_pontoreferencia, :numr_cep, :fd_cidade_id])
    end
end
