class FdProdutosController < ApplicationController
  before_action :set_fd_produto, only: [:show, :edit, :update, :destroy]

  def busca_produtos
    fd_produtos = FdProduto.where(:fd_categoriaproduto_id => params[:fd_categoriaproduto_id], :fd_empresa_id => user.fd_empresa_id)

    #debugger

    fd_produtos_json = fd_produtos.map {|item| {:id => item.id, :nome_produto => item.nome_produto, :desc_produto => item.desc_produto}}
    render :json => fd_produtos_json

  end

  # GET /fd_produtos
  def index
    @fd_produtos = FdProduto.all
  end

  # GET /fd_produtos/1
  def show
  end

  # GET /fd_produtos/new
  def new
    @fd_produto = FdProduto.new
  end

  # GET /fd_produtos/1/edit
  def edit
  end

  # POST /fd_produtos
  def create
    @fd_produto = FdProduto.new(fd_produto_params)

    if @fd_produto.save
      redirect_to @fd_produto, notice: 'Fd produto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_produtos/1
  def update
    if @fd_produto.update(fd_produto_params)
      redirect_to @fd_produto, notice: 'Fd produto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_produtos/1
  def destroy
    @fd_produto.destroy
    redirect_to fd_produtos_url, notice: 'Fd produto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_produto
      @fd_produto = FdProduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_produto_params
      params.require(:fd_produto).permit(:nome_produto, :desc_produto, :numr_porcentagem, :fd_empresa_id, :fd_categoriaproduto_id, :fd_usuario_id)
    end
end
