Food::Application.routes.draw do

  resources :fd_itemalterados

  resources :fd_itempedidos

  resources :fd_itempedidos

  resources :fd_pedidos

  resources :fd_categoriaprodutos

  resources :fd_produtos

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
  match '/pedidos', to: 'static_pedidos#pedidos', via: 'get'

  match '/buscaCategoriaProdutos', to: 'fd_categoriaprodutos#buscaCategoriaProdutos', via: 'get'
  match '/busca_produtos', to: 'fd_produtos#busca_produtos', via: 'get'
  match '/busca_variacaoprodutos', to: 'fd_variacaoprodutos#busca_variacaoprodutos', via: 'get'
  match '/insere_itempedido', to: 'fd_itempedidos#insere_itempedido', via: 'get'
  match '/busca_itempedido', to: 'fd_itempedidos#busca_itempedido', via: 'get'
  match '/dobra_itempedido', to: 'fd_itempedidos#dobra_itempedido', via: 'get'
  match '/exclui_itempedido', to: 'fd_itempedidos#exclui_itempedido', via: 'get'
  match '/insere_variacao_produto', to: 'fd_produtos#salva_variacao_produto', via: 'get'
  match '/busca_item', to: 'fd_itensprodutos#busca_item', via: 'get'
  match '/exclui_variacao_produto', to: 'fd_produtos#exclui_variacao_produto', via: 'get'


end
