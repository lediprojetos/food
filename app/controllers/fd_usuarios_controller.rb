class FdUsuariosController < ApplicationController
  before_action :set_fd_usuario, only: [:show, :edit, :update, :destroy]


def troca_empresa
    fd_usuario = FdUsuario.find(user.id)

    fd_usuario.fd_empresa_id = params[:id]
    fd_usuario.save

    render :json => {}

end
  # GET /fd_usuarios/1/edit
  def login
    @fd_usuario = FdUsuario.new
  end


  # GET /fd_usuarios
  def index
    @fd_usuarios = FdUsuario.all
  end

  # GET /fd_usuarios/1
  def show
  end

  # GET /fd_usuarios/new
  def new
    @fd_usuario = FdUsuario.new
  end

  # GET /fd_usuarios/1/edit
  def edit

  end

  # POST /fd_usuarios
  def create
    @fd_usuario = FdUsuario.new(fd_usuario_params)

    if @fd_usuario.save
      redirect_to @fd_usuario, notice: 'Registro inserido com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_usuarios/1
  def update
    if @fd_usuario.update(fd_usuario_params)
      redirect_to @fd_usuario, notice: 'Registro alterado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_usuarios/1
  def destroy
    @fd_usuario.destroy
    redirect_to fd_usuarios_url, notice: 'Registro inserido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_usuario
      @fd_usuario = FdUsuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_usuario_params
      params.require(:fd_usuario).permit(:desc_nome, :desc_login, :desc_senha, :desc_confirmasenha, :desc_confirmalogin, :data_inclusao, :desc_perfil, :fd_empresa_id)
    end
end
