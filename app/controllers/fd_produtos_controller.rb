class FdProdutosController < ApplicationController
  before_action :set_fd_produto, only: [:show, :edit, :update, :show_service, :edit_service, :destroy]

  def busca_Servicos

    query = " select "
    query = query +  " nome_produto "
    query = query +  " ,numr_porcentagem "
    query = query +  " ,valr_produto"  
    query = query +  " ,fd_produto_id "  
    query = query +  " ,vp.id as fd_variacaoproduto_id "  
    query = query +  " ,Count(ip.id) as qtd" 
    query = query +  " from "
    query = query +  " fd_produtos p "
    query = query +  " inner join fd_variacaoprodutos vp on p.id = vp.fd_produto_id "
    query = query +  " left  join fd_itempedidos ip on ip.fd_variacaoproduto_id = vp.id and fd_pedido_id = "  + params[:fd_pedido_id].to_s
    query = query +  " where "
    query = query +  " p.fd_categoriaproduto_id = " + $Servicos.to_s

    query = query +  " group by "
    query = query +  "   fd_produto_id "
    query = query +  "   ,nome_produto "
    query = query +  "   ,numr_porcentagem "
    query = query +  "   ,valr_produto    "
    query = query +  "   ,vp.id    "

    results = ActiveRecord::Base.connection.execute(query);

    results_json = results.map {|item| {:fd_variacaoproduto_id => item["fd_variacaoproduto_id"], :qtd => item["qtd"], :fd_produto_id => item["fd_produto_id"], :nome_produto => item["nome_produto"], :numr_porcentagem => item["numr_porcentagem"], :valr_produto => item["valr_produto"]}}
    render :json => results_json

  end  

  def busca_produtos
    fd_produtos = FdProduto.where(:fd_categoriaproduto_id => params[:fd_categoriaproduto_id], :fd_empresa_id => user.fd_empresa_id)

    fd_produtos_json = fd_produtos.map {|item| {:id => item.id, :nome_produto => item.nome_produto, :desc_produto => item.desc_produto, :flag_produtomisto => item.flag_produtomisto}}
    render :json => fd_produtos_json

  end

  # GET /fd_produtos
  def index
    @fd_produtos = FdProduto.where('fd_categoriaproduto_id <> ? and fd_empresa_id = ?', $Servicos, user.fd_empresa_id)
  end

  def index_service
    @fd_produtos = FdProduto.where(:fd_categoriaproduto_id => $Servicos)
  end


 def salva_variacao_produto


  fd_validacao = FdVariacaoproduto.where(fd_variaco_id: params[:fd_variaco_id] ,fd_produto_id: params[:fd_produto_id])

  if not fd_validacao.first 
    @fd_variacao_produto = FdVariacaoproduto.new  
    @fd_variacao_produto.valr_produto = params[:valr_produto]
    @fd_variacao_produto.fd_variaco_id = params[:fd_variaco_id]
    @fd_variacao_produto.fd_produto_id = params[:fd_produto_id]

    @fd_variacao_produto.save
 
 end

    fd_variacao = FdVariacaoproduto.where(fd_produto_id: params[:fd_produto_id])

    fd_variacao_json = fd_variacao.map{|item|{:id => item.id, :valr_produto => item.valr_produto, :desc_variacao => item.fd_variacao.desc_variacao}} 
    render :json => fd_variacao_json

end

def exclui_variacao_produto

  @fd_variacao_produto = FdVariacaoproduto.find(params[:fd_variacoproduto_id])

  @fd_variacao_produto.destroy 

  fd_variacao = FdVariacaoproduto.where(fd_produto_id: params[:fd_produto_id])

  fd_variacao_json = fd_variacao.map{|item|{:id => item.id, :valr_produto => item.valr_produto, :desc_variacao => item.fd_variacao.desc_variacao}} 
  render :json => fd_variacao_json

end

def busca_item   
   fd_item = FdItem.all

   fd_item_json = fd_item.map{|item|{:id => item.id, :desc_item => item.desc_item}}
   render :json => fd_item_json

end


def busca_item_produto   
   fd_item = FdItensproduto.where(fd_produto_id: params[:fd_produto_id])
   fd_item_json = fd_item.map{|item|{:id => item.id, :desc_item => item.fd_item.desc_item}}
   render :json => fd_item_json

end

def salva_item_produto
   
    @fd_itemproduto = FdItensproduto.new
    @fd_itemproduto.fd_produto_id = params[:fd_produto_id]
    @fd_itemproduto.fd_item_id = params[:fd_item_id]
    @fd_itemproduto.save
      
    fd_item = FdItensproduto.where(fd_produto_id: params[:fd_produto_id])
    fd_item_json = fd_item.map{|item|{:id => item.id, :desc_item => item.fd_item.desc_item}}
    render :json => fd_item_json

end

def exclui_item_produto
  
  @fd_itemproduto = FdItensproduto.find(params[:fd_itemproduto_id])
  @fd_itemproduto.destroy

  fd_item = FdItensproduto.where(fd_produto_id: params[:fd_produto_id])
  fd_item_json = fd_item.map{|item|{:id => item.id, :desc_item => item.fd_item.desc_item}}
  render :json => fd_item_json

end


def busca_produto
  
  fd_produto = FdProduto.where(fd_categoriaproduto_id: params[:categoria_produto])
  fd_produto_json = fd_produto.map{|item|{:id => item.id, :nome_produto => item.nome_produto}}
  render :json => fd_produto_json

end 

def busca_produto_combo
 
 fd_produtocombo = FdProdutocombo.where(fd_produto_id: params[:fd_produto_id])
 #debugger
 fd_produtocombo_json = fd_produtocombo.map{|item|{:id => item.id, :nome_produto => item.fd_produtocombo.nome_produto}}
 render :json => fd_produtocombo_json

end

def inclui_produto_combo
  
@FdProdutocombo = FdProdutocombo.new
@FdProdutocombo.fd_produto_id = params[:fd_produto_id] 
@FdProdutocombo.fd_produto_combo = params[:fd_produto_combo]

@FdProdutocombo.save

busca_produto_combo

end

def exclui_produto_combo

  @FdProdutocombo = FdProdutocombo.find(params[:fd_produtocombo_id])

  @FdProdutocombo.destroy
  
  busca_produto_combo
end

def inclui_produto_troca
 
 @fd_produtotrocacombo = FdProdutotrocacombo.new

 @fd_produtotrocacombo.fd_produtocombo_id = params[:fd_produtocombo]
 @fd_produtotrocacombo.fd_produto_id = params[:fd_produtotroca]

 @fd_produtotrocacombo.save

 busca_produto_troca(params[:fd_produto_id])

end

def exclui_produto_troca

  @fd_produtotrocacombo = FdProdutotrocacombo.find(params[:fd_produtotroca_id])    
  @fd_produtotrocacombo.destroy

  busca_produto_troca(params[:fd_produto_id])

end

def busca_produto_troca(fd_produto_id)

   fd_produtotrocacombo = FdProdutotrocacombo.joins(:fd_produtocombo).where(fd_produtocombos: {fd_produto_id: fd_produto_id})
   fd_produtotrocacombo_json = fd_produtotrocacombo.map{|item|{:id => item.id, :nome_produtocombo => item.fd_produtocombo.fd_produtocombo.nome_produto, :nome_produtotroca => item.fd_produto.nome_produto}}
   render :json => fd_produtotrocacombo_json

end
# GET /fd_produtos/1
  
def show
end

def show_service
end

  # GET /fd_produtos/new
def new
    @fd_produto = FdProduto.new
    @variacao_produto = FdVariacaoproduto.where(fd_produto_id: params[:id])
    @fd_produtotrocacombo = FdProdutotrocacombo.joins(:fd_produtocombo).where(fd_produtocombos: {fd_produto_id: params[:id]})
end

def new_service
    @fd_produto = FdProduto.new
    @variacao_produto = FdVariacaoproduto.where(fd_produto_id: params[:id])
    @fd_produtotrocacombo = FdProdutotrocacombo.joins(:fd_produtocombo).where(fd_produtocombos: {fd_produto_id: params[:id]})
end

  # GET /fd_produtos/1/edit
  def edit
    @variacao_produto = FdVariacaoproduto.where(fd_produto_id: params[:id])
    @fd_produtotrocacombo = FdProdutotrocacombo.joins(:fd_produtocombo).where(fd_produtocombos: {fd_produto_id: params[:id]})
  end

  def edit_service
    @variacao_produto = FdVariacaoproduto.where(fd_produto_id: params[:id])
    @fd_produtotrocacombo = FdProdutotrocacombo.joins(:fd_produtocombo).where(fd_produtocombos: {fd_produto_id: params[:id]})
  end

  # POST /fd_produtos
  def create


    @fd_produto = FdProduto.new(fd_produto_params)

    if @fd_produto.save
      #render action: 'edit'

      if @fd_produto.fd_categoriaproduto_id == $Servicos
        
         fd_variacaoproduto = FdVariacaoproduto.new(:valr_produto => params[:fd_produto_valor], :fd_variaco_id => $Unico, :fd_produto_id => @fd_produto.id)
         fd_variacaoproduto.save
         redirect_to index_service_path

         return
      end

      redirect_to edit_fd_produto_path(@fd_produto)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_produtos/1
  def update
    if @fd_produto.update(fd_produto_params)
      #redirect_to @fd_produto, notice: 'Fd produto was successfully updated.'
      if @fd_produto.fd_categoriaproduto_id == $Servicos
        redirect_to show_service_fd_produto_path(@fd_produto)

        return
      else
        redirect_to edit_fd_produto_path(@fd_produto)
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_produtos/1
  def destroy
    fd_categoriaproduto_id = @fd_produto.fd_categoriaproduto_id
    @fd_produto.destroy

    if fd_categoriaproduto_id == $Servicos
      redirect_to index_service_path
      return
    else
      redirect_to fd_produtos_url, notice: 'Fd produto was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_produto
      @fd_produto = FdProduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_produto_params
      params.require(:fd_produto).permit(:nome_produto, :desc_produto, :numr_porcentagem, :fd_empresa_id, :fd_categoriaproduto_id, :fd_usuario_id, :flag_produtomisto)
    end
end
