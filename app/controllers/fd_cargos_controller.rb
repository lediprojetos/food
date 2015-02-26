class FdCargosController < ApplicationController
  before_action :set_fd_cargo, only: [:show, :edit, :update, :destroy]

  # GET /fd_cargos
  def index
    @fd_cargos = FdCargo.all
  end

  # GET /fd_cargos/1
  def show
  end

  # GET /fd_cargos/new
  def new
    @fd_cargo = FdCargo.new
  end

  # GET /fd_cargos/1/edit
  def edit
  end

  # POST /fd_cargos
  def create
    @fd_cargo = FdCargo.new(fd_cargo_params)

    if @fd_cargo.save
      redirect_to @fd_cargo, notice: 'Fd cargo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_cargos/1
  def update
    if @fd_cargo.update(fd_cargo_params)
      redirect_to @fd_cargo, notice: 'Fd cargo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_cargos/1
  def destroy
    @fd_cargo.destroy
    redirect_to fd_cargos_url, notice: 'Fd cargo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_cargo
      @fd_cargo = FdCargo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_cargo_params
      params.require(:fd_cargo).permit(:nome_cargo, :desc_cargo, :data_exclusao, :fd_empresa_id)
    end
end
