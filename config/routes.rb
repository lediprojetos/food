Food::Application.routes.draw do
  resources :fd_usuarios

  resources :fd_empresas

  resources :fd_categoriaempresas
  resources :fd_enderecos
  resources :fd_cidades
  resources :fd_estados

  
  root  'static_pages#home'
  
  match '/listarCidade', to: 'fd_cidades#get_cities', via: 'get'

end
