class FdProdutotrocacombosController < ApplicationController
  before_action :set_fd_produtotrocacombo, only: [:show, :edit, :update, :destroy]

  def busca_produto_trocas

    fd_produtostrocas = FdProdutotrocacombo.where(:fd_produtocombos_id => params[:fd_produtocombos_id])

    fd_produtostrocas_json = fd_produtostrocas.map {|item| {:id => item.id, :nome_produto =>  item.fd_produto.nome_produto, :fd_produtos_id =>  item.fd_produtos_id, :fd_produtocombos_id => item.fd_produtocombos_id}}
    render :json => fd_produtostrocas_json

  end

  # GET /fd_produtotrocacombos
  def index
    @fd_produtotrocacombos = FdProdutotrocacombo.all
  end

  # GET /fd_produtotrocacombos/1
  def show
  end

  # GET /fd_produtotrocacombos/new
  def new
    @fd_produtotrocacombo = FdProdutotrocacombo.new
  end

  # GET /fd_produtotrocacombos/1/edit
  def edit
  end

  # POST /fd_produtotrocacombos
  def create
    @fd_produtotrocacombo = FdProdutotrocacombo.new(fd_produtotrocacombo_params)

    if @fd_produtotrocacombo.save
      redirect_to @fd_produtotrocacombo, notice: 'Fd produtotrocacombo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_produtotrocacombos/1
  def update
    if @fd_produtotrocacombo.update(fd_produtotrocacombo_params)
      redirect_to @fd_produtotrocacombo, notice: 'Fd produtotrocacombo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_produtotrocacombos/1
  def destroy
    @fd_produtotrocacombo.destroy
    redirect_to fd_produtotrocacombos_url, notice: 'Fd produtotrocacombo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_produtotrocacombo
      @fd_produtotrocacombo = FdProdutotrocacombo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_produtotrocacombo_params
      params.require(:fd_produtotrocacombo).permit(:fd_produtos_id, :fd_produtocombos_id)
    end
end
