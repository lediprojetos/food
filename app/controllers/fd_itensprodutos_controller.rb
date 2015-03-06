class FdItensprodutosController < ApplicationController
  before_action :set_fd_itensproduto, only: [:show, :edit, :update, :destroy]

  def busca_item

    fd_itensprodutos = FdItensproduto.where(:fd_produto_id => params[:fd_produto_id])
    #qtd = fd_itenspedidos.group(:fd_variacaoproduto_id).count


    fd_itensprodutos_json = fd_itensprodutos.map {|item| {:id => item.id, :fd_produto_id => item.fd_produto_id, :fd_item_id => item.fd_item_id, :desc_item => item.fd_item.desc_item}}
    render :json => fd_itensprodutos_json

  end  

  # GET /fd_itensprodutos
  def index
    @fd_itensprodutos = FdItensproduto.all
  end

  # GET /fd_itensprodutos/1
  def show
  end

  # GET /fd_itensprodutos/new
  def new
    @fd_itensproduto = FdItensproduto.new
  end

  # GET /fd_itensprodutos/1/edit
  def edit
  end

  # POST /fd_itensprodutos
  def create
    @fd_itensproduto = FdItensproduto.new(fd_itensproduto_params)

    if @fd_itensproduto.save
      redirect_to @fd_itensproduto, notice: 'Fd itensproduto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_itensprodutos/1
  def update
    if @fd_itensproduto.update(fd_itensproduto_params)
      redirect_to @fd_itensproduto, notice: 'Fd itensproduto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_itensprodutos/1
  def destroy
    @fd_itensproduto.destroy
    redirect_to fd_itensprodutos_url, notice: 'Fd itensproduto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_itensproduto
      @fd_itensproduto = FdItensproduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_itensproduto_params
      params.require(:fd_itensproduto).permit(:fd_produto_id, :fd_item_id)
    end
end
