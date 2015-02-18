class FdCidadesController < ApplicationController
  before_action :set_fd_cidade, only: [:show, :edit, :update, :destroy]

  # GET /fd_cidades
  def index
    @fd_cidades = FdCidade.all
  end

  # GET /fd_cidades/1
  def show
  end

  # GET /fd_cidades/new
  def new
    @fd_cidade = FdCidade.new
  end

  # GET /fd_cidades/1/edit
  def edit
  end

  def get_cities
    fd_cidades = FdCidade.find :all, :conditions => {:fd_estado_id => params[:id]}, :order => "nome_cidade ASC"
    fd_cidades_json = fd_cidades.map {|item| {:id => item.id, :name => item.nome_cidade}}

    render :json => fd_cidades_json
  end 

  # POST /fd_cidades
  def create
    @fd_cidade = FdCidade.new(fd_cidade_params)

    if @fd_cidade.save
      redirect_to @fd_cidade, notice: 'Fd cidade was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_cidades/1
  def update
    if @fd_cidade.update(fd_cidade_params)
      redirect_to @fd_cidade, notice: 'Fd cidade was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_cidades/1
  def destroy
    @fd_cidade.destroy
    redirect_to fd_cidades_url, notice: 'Fd cidade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_cidade
      @fd_cidade = FdCidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_cidade_params
      params.require(:fd_cidade).permit(:nome_cidade, :fd_estado_id)
    end
end
