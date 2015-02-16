class FdEnderecosController < ApplicationController
  before_action :set_fd_endereco, only: [:show, :edit, :update, :destroy]

  # GET /fd_enderecos
  def index
    @fd_enderecos = FdEndereco.all
  end

  # GET /fd_enderecos/1
  def show
  end

  # GET /fd_enderecos/new
  def new
    @fd_endereco = FdEndereco.new
  end

  # GET /fd_enderecos/1/edit
  def edit
  end

  # POST /fd_enderecos
  def create
    @fd_endereco = FdEndereco.new(fd_endereco_params)

    if @fd_endereco.save
      redirect_to @fd_endereco, notice: 'Fd endereco was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_enderecos/1
  def update
    if @fd_endereco.update(fd_endereco_params)
      redirect_to @fd_endereco, notice: 'Fd endereco was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_enderecos/1
  def destroy
    @fd_endereco.destroy
    redirect_to fd_enderecos_url, notice: 'Fd endereco was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_endereco
      @fd_endereco = FdEndereco.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_endereco_params
      params.require(:fd_endereco).permit(:nome_bairro, :nome_rua, :numr_quadra, :desc_complemento, :desc_pontoreferencia, :numr_cep, :data_inclusao, :fd_cidade_id)
    end
end
