#encoding: utf-8
class FdMesasController < ApplicationController
  before_action :set_fd_mesa, only: [:show, :edit, :update, :destroy]

  # GET /fd_mesas
  def index

   if params[:q]

     @fd_mesa = FdMesa.where(numr_mesa: params[:q].to_i, fd_empresa_id: user.fd_empresa_id)  
     
    #debugger

     if @fd_mesa.first == nil
        @fd_mesa = FdMesa.new
        @fd_mesa.numr_mesa = params[:q]
        @fd_mesa.flag_mesaaberta = true
        @fd_mesa.user_inclusao = user.id
        @fd_mesa.fd_empresa_id = user.fd_empresa_id
       @fd_mesa.save 

     else
       @fd_mesa = FdMesa.new
       redirect_to @fd_mesa, notice: "Mesa #{params[:q]} já está cadastrada "
     end
   end

    @fd_mesas = FdMesa.where(fd_empresa_id: user.fd_empresa_id, data_exclusao: nil).order('numr_mesa ASC').all
   #debugger
    if not @fd_mesas.first == nil
      @numr_mesa =  @fd_mesas.last.numr_mesa + 1
    else
      @numr_mesa = 1
    end
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
    @fd_mesa.user_exclusao = user.id
    @fd_mesa.data_exclusao = Time.now
    @fd_mesa.save
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
