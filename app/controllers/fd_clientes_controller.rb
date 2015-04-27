#encoding: utf-8
class FdClientesController < ApplicationController
  before_action :set_fd_cliente, only: [:show, :edit, :update, :destroy]

  def buscaCliente

    #query = query.downcase

    fd_cliente = FdCliente.where('lower(nome_cliente) like ? and fd_empresa_id = ? ', "%#{params[:nome_cliente].downcase}%", user.fd_empresa_id).limit(3)

    fd_cliente_json = fd_cliente.map {|item| { :fd_cliente_id => item.id, 
                                               :nome_cliente => item.nome_cliente, 
                                               :desc_telefone => item.desc_telefone, 
                                               :nome_rua => item.fd_endereco.nome_rua, 
                                               :numr_quadra => item.fd_endereco.numr_quadra, 
                                               :numr_lote => item.fd_endereco.numr_lote, 
                                               :nome_bairro => item.fd_endereco.nome_bairro, 
                                               :desc_pontoreferencia => item.fd_endereco.desc_pontoreferencia, 
                                               :fd_endereco_id => item.fd_endereco.id}}
    render :json => fd_cliente_json  


  end

  def atualiza_cliente

    fd_pedido = FdPedido.where(:id => params[:fd_pedido_id])
    fd_pedido.first.fd_cliente_id = params[:fd_cliente_id]
    fd_pedido.first.save 

    fd_pedido = FdCliente.where(:id => params[:fd_cliente_id])
    fd_pedido_json = fd_pedido.map {|item| { :fd_cliente_id => item.id, 
                                               :nome_cliente => item.nome_cliente, 
                                               :desc_telefone => item.desc_telefone, 
                                               :nome_rua => item.fd_endereco.nome_rua, 
                                               :numr_quadra => item.fd_endereco.numr_quadra, 
                                               :numr_lote => item.fd_endereco.numr_lote, 
                                               :nome_bairro => item.fd_endereco.nome_bairro, 
                                               :desc_pontoreferencia => item.fd_endereco.desc_pontoreferencia, 
                                               :fd_endereco_id => item.fd_endereco.id}}
    render :json => fd_pedido_json

  end  

  def inclui_cliente


    fd_endereco = FdEndereco.new
    fd_endereco.nome_rua = params[:nome_rua]
    fd_endereco.numr_quadra = params[:numr_quadra]
    fd_endereco.numr_lote = params[:numr_lote]
    fd_endereco.nome_bairro = params[:nome_bairro]
    fd_endereco.desc_pontoreferencia = params[:desc_pontoreferencia]
    fd_endereco.save


    fd_cliente = FdCliente.new
    fd_cliente.nome_cliente = params[:nome_cliente]
    fd_cliente.desc_telefone = params[:desc_telefone]
    fd_cliente.fd_endereco_id = fd_endereco.id
    fd_cliente.fd_empresa_id = user.fd_empresa_id
    fd_cliente.save

    fd_itenspedidos = FdPedido.find(params[:fd_pedido_id])
    fd_itenspedidos.fd_cliente_id = fd_cliente.id 
    fd_itenspedidos.save 

    #fd_itenspedidos_json = fd_itenspedidos.map {|item| { :id => item.id, :desc_observacao => item.desc_observacao, :valr_item => item.valr_item, :tipo_atendimento => item.tipo_atendimento, :fd_empresa_id => item.fd_empresa_id, :fd_variacaoproduto_id => item.fd_variacaoproduto_id, :fd_pedido_id => item.fd_pedido_id, :fd_situacao_id => item.fd_situacao_id, :fd_funcionario_id => item.fd_funcionario_id}}
    render :json => {}

  end

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

    if @fd_estado.fd_endereco.fd_cidade
        @fd_estado = @fd_estado.fd_endereco.fd_cidade.fd_estado.id
    end
    
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
    redirect_to fd_clientes_url, notice: 'Registro excluído com sucesso.'
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
