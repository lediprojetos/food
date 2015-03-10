class FdProdutocombosController < ApplicationController
  before_action :set_fd_produtocombo, only: [:show, :edit, :update, :destroy]

  # GET /fd_produtocombos
  def index
    @fd_produtocombos = FdProdutocombo.all
  end

  # GET /fd_produtocombos/1
  def show
  end

  # GET /fd_produtocombos/new
  def new
    @fd_produtocombo = FdProdutocombo.new
  end

  # GET /fd_produtocombos/1/edit
  def edit
  end

  # POST /fd_produtocombos
  def create
    @fd_produtocombo = FdProdutocombo.new(fd_produtocombo_params)

    if @fd_produtocombo.save
      redirect_to @fd_produtocombo, notice: 'Fd produtocombo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_produtocombos/1
  def update
    if @fd_produtocombo.update(fd_produtocombo_params)
      redirect_to @fd_produtocombo, notice: 'Fd produtocombo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_produtocombos/1
  def destroy
    @fd_produtocombo.destroy
    redirect_to fd_produtocombos_url, notice: 'Fd produtocombo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_produtocombo
      @fd_produtocombo = FdProdutocombo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_produtocombo_params
      params.require(:fd_produtocombo).permit(:fd_produtos_id, :fd_produto_combo)
    end
end
