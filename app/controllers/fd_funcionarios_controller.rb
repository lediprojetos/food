class FdFuncionariosController < ApplicationController
  before_action :set_fd_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /fd_funcionarios
  def index
    @fd_funcionarios = FdFuncionario.all
  end

  # GET /fd_funcionarios/1
  def show
  end

  # GET /fd_funcionarios/new
  def new
    @fd_funcionario = FdFuncionario.new
  end

  # GET /fd_funcionarios/1/edit
  def edit
  end

  # POST /fd_funcionarios
  def create
    @fd_funcionario = FdFuncionario.new(fd_funcionario_params)

    if @fd_funcionario.save
      redirect_to @fd_funcionario, notice: 'Fd funcionario was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_funcionarios/1
  def update
    if @fd_funcionario.update(fd_funcionario_params)
      redirect_to @fd_funcionario, notice: 'Fd funcionario was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_funcionarios/1
  def destroy
    @fd_funcionario.destroy
    redirect_to fd_funcionarios_url, notice: 'Fd funcionario was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_funcionario
      @fd_funcionario = FdFuncionario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_funcionario_params
      params.require(:fd_funcionario).permit(:nome_funcionario, :desc_telefone, :desc_celular, :data_exclusao, :fd_cargo_id, :fd_endereco_id, :fd_empresa_id)
    end
end
