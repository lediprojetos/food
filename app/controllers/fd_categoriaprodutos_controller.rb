class FdCategoriaprodutosController < ApplicationController
  before_action :set_fd_categoriaproduto, only: [:show, :edit, :update, :destroy]


  def buscaCategoriaProdutos
    if params[:father_id].blank?
      fd_categoriaprodutos = FdCategoriaproduto.where('id <> ' + $Servicos.to_s)
    else
      fd_categoriaprodutos = FdCategoriaproduto.where('father_id = ' + params[:father_id].to_s + ' and id <> ' + $Servicos.to_s)
    end

    fd_categoriaprodutos_json = fd_categoriaprodutos.map {|item| {:id => item.id, :desc_categoria => item.desc_categoria}}
    render :json => fd_categoriaprodutos_json

  end  

  # GET /fd_categoriaprodutos
  def index
    @fd_categoriaprodutos = FdCategoriaproduto.where('id <> ? and id <> ?', $Servicos, $Combos)
  end

  # GET /fd_categoriaprodutos/1
  def show
  end

  # GET /fd_categoriaprodutos/new
  def new
    @fd_categoriaproduto = FdCategoriaproduto.new
  end

  # GET /fd_categoriaprodutos/1/edit
  def edit
  end

  # POST /fd_categoriaprodutos
  def create
    @fd_categoriaproduto = FdCategoriaproduto.new(fd_categoriaproduto_params)

    if @fd_categoriaproduto.save
      redirect_to @fd_categoriaproduto, notice: 'Fd categoriaproduto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_categoriaprodutos/1
  def update
    if @fd_categoriaproduto.update(fd_categoriaproduto_params)
      redirect_to @fd_categoriaproduto, notice: 'Fd categoriaproduto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_categoriaprodutos/1
  def destroy
    @fd_categoriaproduto.destroy
    redirect_to fd_categoriaprodutos_url, notice: 'Fd categoriaproduto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_categoriaproduto
      @fd_categoriaproduto = FdCategoriaproduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_categoriaproduto_params
      params.require(:fd_categoriaproduto).permit(:desc_categoria, :father_id, :flag_global, :fd_empresa_id)
    end
end
