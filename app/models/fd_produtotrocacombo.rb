class FdProdutotrocacombo < ActiveRecord::Base
  belongs_to :fd_produtos
  belongs_to :fd_produtocombos
  belongs_to :fd_produto, :class_name => "FdProduto", :foreign_key => "fd_produtos_id"
end
