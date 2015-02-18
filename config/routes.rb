Food::Application.routes.draw do

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
  match '/login2', to: 'fd_autentication#login2', via: 'post'

end
