class FdItensprodutosController < ApplicationController
  before_action :set_fd_itensproduto, only: [:show, :edit, :update, :destroy]

  def busca_itemMisto

    fd_itenspedidos = FdPedidomisto.find(params[:fd_pedidomisto_id])
    fd_variacaoproduto = FdVariacaoproduto.find(fd_itenspedidos.fd_variacaoproduto_id)
    
    query = " select "
    query = query +  " * "
    query = query +  " from "
    query = query +  " fd_itensprodutos ipr "
    query = query +  " left join fd_itemalterados ial on ial.fd_items_id = ipr.fd_item_id and fd_pedidomisto_id = " + params[:fd_pedidomisto_id].to_s
    query = query +  " inner join fd_items i on i.id = ipr.fd_item_id "
    query = query +  " where "
    query = query +  " (ipr.fd_produto_id = "+fd_variacaoproduto.fd_produto_id.to_s+" ) "

    results = ActiveRecord::Base.connection.execute(query);

    #debugger

    results_json = results.map {|item| {:id => item["id"], :fd_pedidomisto_id => params[:fd_pedidomisto_id], :fd_produto_id => item["fd_produto_id"], :desc_item => item["desc_item"], :numr_qtd => (item["numr_quntidade"] rescue nil), :fd_itempedido_id => params[:fd_itempedido_id]}}
    render :json => results_json

  end

  def busca_item

    fd_itenspedidos = FdItempedido.find(params[:fd_itempedido_id])
    fd_variacaoproduto = FdVariacaoproduto.find(fd_itenspedidos.fd_variacaoproduto_id)
    
    query = " select "
    query = query +  " * "
    query = query +  " from "
    query = query +  " fd_itensprodutos ipr "
    query = query +  " left join fd_itemalterados ial on ial.fd_items_id = ipr.fd_item_id and fd_itempedido_id = " + params[:fd_itempedido_id].to_s
    query = query +  " inner join fd_items i on i.id = ipr.fd_item_id "
    query = query +  " where "
    query = query +  " (ipr.fd_produto_id = "+fd_variacaoproduto.fd_produto_id.to_s+" ) "

    results = ActiveRecord::Base.connection.execute(query);

    #debugger

    results_json = results.map {|item| {:id => item["id"], :fd_produto_id => item["fd_produto_id"], :desc_item => item["desc_item"], :numr_qtd => item["numr_quntidade"], :fd_itempedido_id => params[:fd_itempedido_id]}}
    render :json => results_json

  end  

  # GET /fd_itensprodutos
  def index
    @fd_itensprodutos = FdItensproduto.all
  end

  # GET /fd_itensprodutos/1
  def show
  end

  # GET /fd_itensprodutos/new
  def new
    @fd_itensproduto = FdItensproduto.new
  end

  # GET /fd_itensprodutos/1/edit
  def edit
  end

  # POST /fd_itensprodutos
  def create
    @fd_itensproduto = FdItensproduto.new(fd_itensproduto_params)

    if @fd_itensproduto.save
      redirect_to @fd_itensproduto, notice: 'Fd itensproduto was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_itensprodutos/1
  def update
    if @fd_itensproduto.update(fd_itensproduto_params)
      redirect_to @fd_itensproduto, notice: 'Fd itensproduto was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_itensprodutos/1
  def destroy
    @fd_itensproduto.destroy
    redirect_to fd_itensprodutos_url, notice: 'Fd itensproduto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_itensproduto
      @fd_itensproduto = FdItensproduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_itensproduto_params
      params.require(:fd_itensproduto).permit(:fd_produto_id, :fd_item_id)
    end
end
