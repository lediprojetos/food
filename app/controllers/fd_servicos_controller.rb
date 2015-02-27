class FdServicosController < ApplicationController
  before_action :set_fd_servico, only: [:show, :edit, :update, :destroy]

  # GET /fd_servicos
  def index
    @fd_servicos = FdServico.all
  end

  # GET /fd_servicos/1
  def show
  end

  # GET /fd_servicos/new
  def new
    @fd_servico = FdServico.new
  end

  # GET /fd_servicos/1/edit
  def edit
  end

  # POST /fd_servicos
  def create
    @fd_servico = FdServico.new(fd_servico_params)

    if @fd_servico.save
      redirect_to @fd_servico, notice: 'Fd servico was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_servicos/1
  def update
    if @fd_servico.update(fd_servico_params)
      redirect_to @fd_servico, notice: 'Fd servico was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_servicos/1
  def destroy
    @fd_servico.destroy
    redirect_to fd_servicos_url, notice: 'Fd servico was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_servico
      @fd_servico = FdServico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_servico_params
      params.require(:fd_servico).permit(:desc_servico, :numr_porcentagem, :valr_servico, :flag_ativo, :data_exclusao)
    end
end
