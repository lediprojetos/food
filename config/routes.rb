Food::Application.routes.draw do

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


end
