#encoding: utf-8
class FdMesasController < ApplicationController
  before_action :set_fd_mesa, only: [:show, :edit, :update, :destroy]

  # GET /fd_mesas
  def index
    @fd_mesas = FdMesa.all
  end

  # GET /fd_mesas/1
  def show
  end

  # GET /fd_mesas/new
  def new
    @fd_mesa = FdMesa.new
  end

  # GET /fd_mesas/1/edit
  def edit
  end

  # POST /fd_mesas
  def create
    @fd_mesa = FdMesa.new(fd_mesa_params)

    if @fd_mesa.save
      redirect_to @fd_mesa, notice: 'Registro incluindo com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_mesas/1
  def update
    if @fd_mesa.update(fd_mesa_params)
      redirect_to @fd_mesa, notice: 'Registro alterado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_mesas/1
  def destroy
    @fd_mesa.destroy
    redirect_to fd_mesas_url, notice: 'Registro excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_mesa
      @fd_mesa = FdMesa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_mesa_params
      params.require(:fd_mesa).permit(:numr_mesa, :desc_mesa, :flag_mesaaberta, :fd_empresa_id, :user_inclusao, :user_exclusao, :data_exclusao)
    end
end
