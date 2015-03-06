class FdItemalteradosController < ApplicationController
  before_action :set_fd_itemalterado, only: [:show, :edit, :update, :destroy]

  # GET /fd_itemalterados
  def index
    @fd_itemalterados = FdItemalterado.all
  end

  # GET /fd_itemalterados/1
  def show
  end

  # GET /fd_itemalterados/new
  def new
    @fd_itemalterado = FdItemalterado.new
  end

  # GET /fd_itemalterados/1/edit
  def edit
  end

  # POST /fd_itemalterados
  def create
    @fd_itemalterado = FdItemalterado.new(fd_itemalterado_params)

    if @fd_itemalterado.save
      redirect_to @fd_itemalterado, notice: 'Fd itemalterado was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_itemalterados/1
  def update
    if @fd_itemalterado.update(fd_itemalterado_params)
      redirect_to @fd_itemalterado, notice: 'Fd itemalterado was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_itemalterados/1
  def destroy
    @fd_itemalterado.destroy
    redirect_to fd_itemalterados_url, notice: 'Fd itemalterado was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_itemalterado
      @fd_itemalterado = FdItemalterado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_itemalterado_params
      params.require(:fd_itemalterado).permit(:numr_acao, :numr_quntidade, :fd_itempedido_id, :fd_items_id)
    end
end
