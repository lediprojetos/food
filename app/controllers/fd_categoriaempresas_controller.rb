class FdCategoriaempresasController < ApplicationController
  before_action :set_fd_categoriaempresa, only: [:show, :edit, :update, :destroy]

  # GET /fd_categoriaempresas
  def index
    @fd_categoriaempresas = FdCategoriaempresa.all
  end

  # GET /fd_categoriaempresas/1
  def show
  end

  # GET /fd_categoriaempresas/new
  def new
    @fd_categoriaempresa = FdCategoriaempresa.new
  end

  # GET /fd_categoriaempresas/1/edit
  def edit
  end

  # POST /fd_categoriaempresas
  def create
    @fd_categoriaempresa = FdCategoriaempresa.new(fd_categoriaempresa_params)

    if @fd_categoriaempresa.save
      redirect_to @fd_categoriaempresa, notice: 'Fd categoriaempresa was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_categoriaempresas/1
  def update
    if @fd_categoriaempresa.update(fd_categoriaempresa_params)
      redirect_to @fd_categoriaempresa, notice: 'Fd categoriaempresa was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_categoriaempresas/1
  def destroy
    @fd_categoriaempresa.destroy
    redirect_to fd_categoriaempresas_url, notice: 'Fd categoriaempresa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_categoriaempresa
      @fd_categoriaempresa = FdCategoriaempresa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_categoriaempresa_params
      params.require(:fd_categoriaempresa).permit(:nome_categoria)
    end
end
