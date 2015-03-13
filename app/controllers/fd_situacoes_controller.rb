class FdSituacoesController < ApplicationController
  before_action :set_fd_situacao, only: [:show, :edit, :update, :destroy]

  # GET /fd_situacoes
  def index
    @fd_situacoes = FdSituacao.all
  end

  # GET /fd_situacoes/1
  def show
  end

  # GET /fd_situacoes/new
  def new
    @fd_situacao = FdSituacao.new
  end

  # GET /fd_situacoes/1/edit
  def edit
  end

  # POST /fd_situacoes
  def create
    @fd_situacao = FdSituacao.new(fd_situacao_params)

    if @fd_situacao.save
      redirect_to @fd_situacao, notice: 'Fd situacao was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_situacoes/1
  def update
    if @fd_situacao.update(fd_situacao_params)
      redirect_to @fd_situacao, notice: 'Fd situacao was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_situacoes/1
  def destroy
    @fd_situacao.destroy
    redirect_to fd_situacoes_url, notice: 'Fd situacao was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_situacao
      @fd_situacao = FdSituacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_situacao_params
      params.require(:fd_situacao).permit(:nome_situacao, :desc_situacao, :data_bloqueio)
    end
end
