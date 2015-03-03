class FdVariacaoprodutosController < ApplicationController
  before_action :set_fd_variacaoproduto, only: [:show, :edit, :update, :destroy]

  # GET /fd_variacaoprodutos
  def index
    @fd_variacaoprodutos = FdVariacaoproduto.all
  end

  # GET /fd_variacaoprodutos/1
  def show
  end

  # GET /fd_variacaoprodutos/new
  def new
    @fd_variacaoproduto = FdVariacaoproduto.new
  end

  # GET /fd_variacaoprodutos/1/edit
  def edit
  end

  # POST /fd_variacaoprodutos
  def create
    @fd_variacaoproduto = FdVariacaoproduto.new(fd_variacaoproduto_params)

    if @fd_variacaoproduto.save
      redirect_to @fd_variacaoproduto, notice: 'Fd variacaoproduto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_variacaoprodutos/1
  def update
    if @fd_variacaoproduto.update(fd_variacaoproduto_params)
      redirect_to @fd_variacaoproduto, notice: 'Fd variacaoproduto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_variacaoprodutos/1
  def destroy
    @fd_variacaoproduto.destroy
    redirect_to fd_variacaoprodutos_url, notice: 'Fd variacaoproduto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_variacaoproduto
      @fd_variacaoproduto = FdVariacaoproduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_variacaoproduto_params
      params.require(:fd_variacaoproduto).permit(:valr_produto, :fd_variaco_id, :fd_produto_id)
    end
end
