class FdStatusesController < ApplicationController
  before_action :set_fd_status, only: [:show, :edit, :update, :destroy]

  # GET /fd_statuses
  def index
    @fd_statuses = FdStatus.all
  end

  # GET /fd_statuses/1
  def show
  end

  # GET /fd_statuses/new
  def new
    @fd_status = FdStatus.new
  end

  # GET /fd_statuses/1/edit
  def edit
  end

  # POST /fd_statuses
  def create
    @fd_status = FdStatus.new(fd_status_params)

    if @fd_status.save
      redirect_to @fd_status, notice: 'Fd status was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_statuses/1
  def update
    if @fd_status.update(fd_status_params)
      redirect_to @fd_status, notice: 'Fd status was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_statuses/1
  def destroy
    @fd_status.destroy
    redirect_to fd_statuses_url, notice: 'Fd status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_status
      @fd_status = FdStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_status_params
      params.require(:fd_status).permit(:nome_status, :desc_status)
    end
end
