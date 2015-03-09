class FdItensadicionalsController < ApplicationController
  before_action :set_fd_itensadicional, only: [:show, :edit, :update, :destroy]

  def busca_itemadicional

    query = " select "
    query = query +  " ia.id as fd_intensadicional_id1, * "
    query = query +  " from "
    query = query +  " fd_itensadicionals ia "
    query = query +  " left join fd_adicionaisinclusos ai on ai.fd_intensadicional_id = ia.id and fd_itempedido_id = " + params[:fd_itempedido_id].to_s
    query = query +  " inner join fd_items it on ia.fd_item_id = it.id"
    query = query +  " where "
    query = query +  " fd_categoriaproduto_id = " + params[:fd_categoriaproduto_id].to_s

    results = ActiveRecord::Base.connection.execute(query);

    results_json = results.map {|item| {:fd_itempedido_id => params[:fd_itempedido_id], :fd_intensadicional_id => item["fd_intensadicional_id1"], :fd_item_id => item["fd_item_id"], :desc_item => item["desc_item"], :fd_categoriaproduto_id => item["fd_categoriaproduto_id"], :valr_item => item["valr_item"], :numr_quantidade => item["numr_quantidade"].blank? ? '' : item["numr_quantidade"]}}
    render :json => results_json

  end    

  # GET /fd_itensadicionals
  def index
    @fd_itensadicionals = FdItensadicional.all
  end

  # GET /fd_itensadicionals/1
  def show
  end

  # GET /fd_itensadicionals/new
  def new
    @fd_itensadicional = FdItensadicional.new
  end

  # GET /fd_itensadicionals/1/edit
  def edit
  end

  # POST /fd_itensadicionals
  def create
    @fd_itensadicional = FdItensadicional.new(fd_itensadicional_params)

    if @fd_itensadicional.save
      redirect_to @fd_itensadicional, notice: 'Fd itensadicional was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_itensadicionals/1
  def update
    if @fd_itensadicional.update(fd_itensadicional_params)
      redirect_to @fd_itensadicional, notice: 'Fd itensadicional was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_itensadicionals/1
  def destroy
    @fd_itensadicional.destroy
    redirect_to fd_itensadicionals_url, notice: 'Fd itensadicional was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_itensadicional
      @fd_itensadicional = FdItensadicional.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_itensadicional_params
      params.require(:fd_itensadicional).permit(:fd_item_id, :fd_categoriaproduto_id, :valr_item)
    end
end
