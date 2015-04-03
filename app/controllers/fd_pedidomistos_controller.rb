class FdPedidomistosController < ApplicationController
  before_action :set_fd_pedidomisto, only: [:show, :edit, :update, :destroy]


  def busca_DetalhesMistos


    fd_itenspedidos = FdPedidomisto.where(:fd_itempedidos_id => params[:fd_itempedidos_id])

    fd_itenspedidos_json = fd_itenspedidos.map {|item| {:fd_categoriaproduto_id => item.fd_variacaoproduto.fd_produto.fd_categoriaproduto_id, :id => item.id, :fd_produto_id => item.fd_produto_id, :nome_produto => item.fd_variacaoproduto.fd_produto.nome_produto}}
    render :json => fd_itenspedidos_json

  end


  # GET /fd_pedidomistos
  def index
    @fd_pedidomistos = FdPedidomisto.all
  end

  # GET /fd_pedidomistos/1
  def show
  end

  # GET /fd_pedidomistos/new
  def new
    @fd_pedidomisto = FdPedidomisto.new
  end

  # GET /fd_pedidomistos/1/edit
  def edit
  end

  # POST /fd_pedidomistos
  def create
    @fd_pedidomisto = FdPedidomisto.new(fd_pedidomisto_params)

    if @fd_pedidomisto.save
      redirect_to @fd_pedidomisto, notice: 'Fd pedidomisto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_pedidomistos/1
  def update
    if @fd_pedidomisto.update(fd_pedidomisto_params)
      redirect_to @fd_pedidomisto, notice: 'Fd pedidomisto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_pedidomistos/1
  def destroy
    @fd_pedidomisto.destroy
    redirect_to fd_pedidomistos_url, notice: 'Fd pedidomisto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_pedidomisto
      @fd_pedidomisto = FdPedidomisto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_pedidomisto_params
      params.require(:fd_pedidomisto).permit(:fd_produto_id, :fd_itempedidos_id)
    end
end
