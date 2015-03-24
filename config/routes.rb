Food::Application.routes.draw do

  resources :fd_pedidomistos

  resources :fd_situacoes

  resources :fd_produtotrocacombos

  resources :fd_pedidocombos

  resources :fd_produtocombos

  resources :fd_adicionaisinclusos

  resources :fd_itemalterados
  resources :fd_itempedidos
  resources :fd_pedidos
  resources :fd_categoriaprodutos

  resources :fd_produtos do
    member do
      get :show_service   
      get :edit_service   
    end
  end

  match '/index_service', to: 'fd_produtos#index_service', via: 'get'
  match '/new_service', to: 'fd_produtos#new_service', via: 'get'


  resources :fd_variacaos
  resources :fd_formapagamentos
  resources :fd_statuses
  resources :fd_variacaoprodutos
  resources :fd_itensprodutos
  resources :fd_itensadicionals
  resources :fd_items
  resources :fd_funcionarios
  resources :fd_cargos
  resources :fd_produtos
  resources :fd_categoriaprodutos
  resources :fd_mesas
  resources :fd_clientes

  root  'static_pages#home'
  match '/report', to: 'static_pages#report', via: 'get'
  match '/config2', to: 'static_pages#config2', via: 'get'

  resources :fd_usuarios
  resources :fd_empresas
  resources :fd_categoriaempresas
  resources :fd_enderecos
  resources :fd_cidades
  resources :fd_estados

  match '/listarCidade', to: 'fd_cidades#get_cities', via: 'get'
  
  match '/login', to: 'fd_autentication#login', via: 'get'
  match '/login', to: 'fd_autentication#login', via: 'post'
  match '/logoff', to: 'fd_autentication#logoff', via: 'get'

  match '/tipo_pedido', to: 'static_pedidos#tipo_pedido', via: 'get'
  match '/lista_mesas', to: 'static_pedidos#lista_mesas', via: 'get'
  get '/pedidos/:fd_mesa_id/:fd_pedido_id/:tipo_atendimento', to: 'static_pedidos#pedidos', as: 'pedidos'

  get '/lista_pedidos/:fd_mesa_id/:tipo_atendimento', to: 'static_pedidos#lista_pedidos', as: 'lista_pedidos'

  get '/fecha_pedido/:fd_mesa_id/:fd_pedido_id', to: 'static_pedidos#fecha_pedido', as: 'fecha_pedido'

  match '/buscaCategoriaProdutos', to: 'fd_categoriaprodutos#buscaCategoriaProdutos', via: 'get'
  match '/busca_produtos', to: 'fd_produtos#busca_produtos', via: 'get'
  match '/busca_variacaoprodutos', to: 'fd_variacaoprodutos#busca_variacaoprodutos', via: 'get'
  match '/insere_itempedido', to: 'fd_itempedidos#insere_itempedido', via: 'get'
  match '/atualiza_tipoatendimento', to: 'fd_itempedidos#atualiza_tipoatendimento', via: 'get'
  
  match '/busca_itempedido', to: 'fd_itempedidos#busca_itempedido', via: 'get'
  match '/dobra_itempedido', to: 'fd_itempedidos#dobra_itempedido', via: 'get'
  match '/exclui_itempedido', to: 'fd_itempedidos#exclui_itempedido', via: 'get'
  match '/exclui_servicopedido', to: 'fd_itempedidos#exclui_servicopedido', via: 'get'
  match '/insere_variacao_produto', to: 'fd_produtos#salva_variacao_produto', via: 'get'
  match '/busca_item', to: 'fd_itensprodutos#busca_item', via: 'get'
  match '/insere_ingredientealterado', to: 'fd_itemalterados#insere_ingredientealterado', via: 'get'
  match '/exclui_variacao_produto', to: 'fd_produtos#exclui_variacao_produto', via: 'get'
  match '/busca_items', to: 'fd_produtos#busca_item', via: 'get'
  match '/busca_itemsproduto', to: 'fd_produtos#busca_item_produto', via: 'get'
  match '/busca_itemadicional', to: 'fd_itensadicionals#busca_itemadicional', via: 'get'
  match '/insere_adicionais', to: 'fd_adicionaisinclusos#insere_adicionais', via: 'get'
  match '/salva_item_produto', to: 'fd_produtos#salva_item_produto', via: 'get'
  match '/exclui_item_produto', to: 'fd_produtos#exclui_item_produto', via: 'get'
  match '/busca_trocas', to: 'fd_pedidocombos#busca_trocas', via: 'get'
  match '/busca_produto', to: 'fd_produtos#busca_produto', via: 'get'
  match '/busca_produto_trocas', to: 'fd_produtotrocacombos#busca_produto_trocas', via: 'get'
  match '/troca_produtos_combo', to: 'fd_pedidocombos#troca_produtos_combo', via: 'get'
  match '/inclui_produto_combo', to: 'fd_produtos#inclui_produto_combo', via: 'get'
  match '/busca_produto_combo', to: 'fd_produtos#busca_produto_combo', via: 'get'
  match '/exclui_produto_combo', to: 'fd_produtos#exclui_produto_combo', via: 'get'
  match '/inclui_produto_troca', to: 'fd_produtos#inclui_produto_troca', via: 'get'
  match '/exclui_produto_troca', to: 'fd_produtos#exclui_produto_troca', via: 'get'
  match '/inclui_item_adicinal', to: 'fd_itensadicionals#inclui_item_adicinal', via: 'get'
  match '/exclui_item_adicinal', to: 'fd_itensadicionals#exclui_item_adicinal', via: 'get'
  match '/relPedidos', to: 'fd_pedidos#relPedidos', via: 'get'
  match '/busca_Servicos', to: 'fd_produtos#busca_Servicos', via: 'get'
  match '/insere_pedidomisto', to: 'fd_itempedidos#insere_pedidomisto', via: 'get'
  match '/busca_DetalhesMistos', to: 'fd_pedidomistos#busca_DetalhesMistos', via: 'get'
  match '/lista_pedidos_geral', to: 'static_pedidos#lista_pedidos_geral', via: 'get'
  match '/busca_pedidos_geral', to: 'static_pedidos#busca_pedidos_geral', via: 'get'

  

end
