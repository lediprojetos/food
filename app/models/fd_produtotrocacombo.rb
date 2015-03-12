class FdProdutotrocacombo < ActiveRecord::Base
  belongs_to :fd_produto
  belongs_to :fd_produtocombo
  #belongs_to :fd_produto, :class_name => "FdProduto", :foreign_key => "fd_produtos_id"
end
