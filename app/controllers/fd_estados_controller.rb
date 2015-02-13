class FdEstadosController < ApplicationController
  before_action :set_fd_estado, only: [:show, :edit, :update, :destroy]

  # GET /fd_estados
  def index
    @fd_estados = FdEstado.all
  end

  # GET /fd_estados/1
  def show
  end

  # GET /fd_estados/new
  def new
    @fd_estado = FdEstado.new
  end

  # GET /fd_estados/1/edit
  def edit
  end

  # POST /fd_estados
  def create
    @fd_estado = FdEstado.new(fd_estado_params)

    if @fd_estado.save
      redirect_to @fd_estado, notice: 'Fd estado was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_estados/1
  def update
    if @fd_estado.update(fd_estado_params)
      redirect_to @fd_estado, notice: 'Fd estado was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_estados/1
  def destroy
    @fd_estado.destroy
    redirect_to fd_estados_url, notice: 'Fd estado was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_estado
      @fd_estado = FdEstado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_estado_params
      params.require(:fd_estado).permit(:nome_estado, :sigla_estado)
    end
end
