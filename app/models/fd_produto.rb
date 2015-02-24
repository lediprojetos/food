class FdProduto < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_categoriaproduto
  belongs_to :fd_usuario
end
