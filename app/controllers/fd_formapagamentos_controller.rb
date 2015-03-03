class FdFormapagamentosController < ApplicationController
  before_action :set_fd_formapagamento, only: [:show, :edit, :update, :destroy]

  # GET /fd_formapagamentos
  def index
    @fd_formapagamentos = FdFormapagamento.all
  end

  # GET /fd_formapagamentos/1
  def show
  end

  # GET /fd_formapagamentos/new
  def new
    @fd_formapagamento = FdFormapagamento.new
  end

  # GET /fd_formapagamentos/1/edit
  def edit
  end

  # POST /fd_formapagamentos
  def create
    @fd_formapagamento = FdFormapagamento.new(fd_formapagamento_params)

    if @fd_formapagamento.save
      redirect_to @fd_formapagamento, notice: 'Fd formapagamento was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_formapagamentos/1
  def update
    if @fd_formapagamento.update(fd_formapagamento_params)
      redirect_to @fd_formapagamento, notice: 'Fd formapagamento was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_formapagamentos/1
  def destroy
    @fd_formapagamento.destroy
    redirect_to fd_formapagamentos_url, notice: 'Fd formapagamento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_formapagamento
      @fd_formapagamento = FdFormapagamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_formapagamento_params
      params.require(:fd_formapagamento).permit(:desc_formapagamento)
    end
end
