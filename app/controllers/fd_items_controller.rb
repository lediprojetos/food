class FdItemsController < ApplicationController
  before_action :set_fd_item, only: [:show, :edit, :update, :destroy]

  # GET /fd_items
  def index
    @fd_items = FdItem.all
  end

  # GET /fd_items/1
  def show
  end

  # GET /fd_items/new
  def new
    @fd_item = FdItem.new
  end

  # GET /fd_items/1/edit
  def edit
  end

  # POST /fd_items
  def create
    @fd_item = FdItem.new(fd_item_params)

    if @fd_item.save
      redirect_to @fd_item, notice: 'Fd item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_items/1
  def update
    if @fd_item.update(fd_item_params)
      redirect_to @fd_item, notice: 'Fd item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_items/1
  def destroy
    @fd_item.destroy
    redirect_to fd_items_url, notice: 'Fd item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_item
      @fd_item = FdItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_item_params
      params.require(:fd_item).permit(:desc_item, :data_exclusao, :fd_empresa_id)
    end
end
