class FdPedidocombosController < ApplicationController
  before_action :set_fd_pedidocombo, only: [:show, :edit, :update, :destroy]

  def busca_trocas

    fd_produtocombos_id = FdItempedido.find(params[:fd_itempedidos_id]) 
    fd_produtocombos_id = fd_produtocombos_id.fd_variacaoproduto.fd_produto_id

    #fd_produtocombo = FdPedidocombo.joins('inner join fd_produtocombos pc on pc.fd_produto_combo = fd_produtos_id and fd_produto_id = ' +fd_produtocombos_id.to_s).where(:fd_itempedidos_id => params[:fd_itempedidos_id])

    query = "select pc.id as id, pr.nome_produto from  "
    query = query + "fd_pedidocombos pdc "
    query = query + "inner join fd_produtocombos pc on  pc.fd_produto_combo = fd_produtos_id and fd_produto_id = " +fd_produtocombos_id.to_s
    query = query + "inner join fd_produtos pr on  pr.id = fd_produto_combo "
    query = query + " where  fd_itempedidos_id =  " + params[:fd_itempedidos_id].to_s

    results = ActiveRecord::Base.connection.execute(query);


    #debugger

    fd_produtocombo_json = results.map {|item| {:id => item["id"], 
                                                :fd_produto_id =>  item["fd_produto_id"], 
                                                :fd_itempedidos_id => item["fd_itempedidos_id"],
                                                :nome_produto => item["nome_produto"]}}
    render :json => fd_produtocombo_json

  end

  def troca_produtos_combo

    fd_produtocombo = FdPedidocombo.where(:fd_itempedidos_id => params[:fd_itempedidos_id], :fd_produtos_id => params[:fd_produtos_id_trocado])

    fd_produtocombo.first.fd_produto_id = params[:fd_produtos_id_desejado]
    fd_produtocombo.first.save

    fd_produtocombo = FdPedidocombo.where(:fd_itempedidos_id => params[:fd_itempedidos_id])

    fd_produtocombo_json = fd_produtocombo.map {|item| {:id => item.id, :fd_produtos_id =>  item.fd_produtos_id, :fd_itempedidos_id => item.fd_itempedidos_id, :nome_produto => item.fd_produto.nome_produto}}
    render :json => fd_produtocombo_json

  end  

  # GET /fd_pedidocombos
  def index
    @fd_pedidocombos = FdPedidocombo.all
  end

  # GET /fd_pedidocombos/1
  def show
  end

  # GET /fd_pedidocombos/new
  def new
    @fd_pedidocombo = FdPedidocombo.new
  end

  # GET /fd_pedidocombos/1/edit
  def edit
  end

  # POST /fd_pedidocombos
  def create
    @fd_pedidocombo = FdPedidocombo.new(fd_pedidocombo_params)

    if @fd_pedidocombo.save
      redirect_to @fd_pedidocombo, notice: 'Fd pedidocombo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_pedidocombos/1
  def update
    if @fd_pedidocombo.update(fd_pedidocombo_params)
      redirect_to @fd_pedidocombo, notice: 'Fd pedidocombo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_pedidocombos/1
  def destroy
    @fd_pedidocombo.destroy
    redirect_to fd_pedidocombos_url, notice: 'Fd pedidocombo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_pedidocombo
      @fd_pedidocombo = FdPedidocombo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_pedidocombo_params
      params.require(:fd_pedidocombo).permit(:fd_itempedidos_id, :fd_produtos_id)
    end
end
